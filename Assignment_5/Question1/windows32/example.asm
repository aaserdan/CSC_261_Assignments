; a non-recursive algorithm to find the greatest
; common divisor of two positive numbers.
; Author:  Arturo A. Serdan
; Date:    06/07/2019

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
a		DWORD   ?
b		DWORD	?
t		DWORD	?			 

number2 DWORD   ?
prompt1 BYTE    "Enter an A positive integer", 0
prompt2 BYTE    "Enter a B positive integer", 0
string  BYTE    40 DUP (?)
resultLbl BYTE  "The Greater Common Divisor", 0
ans     BYTE    11 DUP (?), 0

;Displayed if an error occurs
ErrorRest BYTE	"An error occurred", 0
wrongInt  BYTE	"Wrong integer input",0


.CODE
_MainProc PROC
        input   prompt1, string, 40      ; read ASCII characters
        atod    string          ; convert to integer
        mov     a, eax			; store in memory
		cmp		a, 1			; compares a and 1
		jnge	erCode			; if a is less or equal to 1

        input   prompt2, string, 40      ; repeat for second number
        atod    string
        mov     b, eax
		cmp		b, 1			; compares b and 1
		jnge	erCode			; if b is less or equal to 1
        
		push	b				; b parameter
		push	a				; a parameter
		call	greatDiv		; greatDiv(a, b)
		add		esp, 8			; remove parameters from stack

        dtoa    ans, eax        ; convert to ASCII characters
        output  resultLbl, ans          ; output label and gcd
		cmp		eax,eax			; compares to itself to exit
		je		exitCode		; jumps to exitCode

	erCode:	
		output  ErrorRest, wrongInt          ; error output&label

	exitCode:
        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP

; int gdc(int a, int b) - takes two positive integers
; returns the gdc(a,b)
; do t = b, b = a, a = t mod a. while(a != 0). returns b
greatDiv PROC
		
		push	ebp				; save base pointer 
		mov		ebp, esp		; establish stack frame 
		push	ebx				; save EBX
		push	edx				; save EDX
		push	ecx				; save ECX
		
		mov		ecx, [ebp+12]	; places value of int b into ecx , value for b
		mov		ebx, [ebp+8]	; places value of int a into ebx, value of a

	loopDiv:
		mov		eax, ecx		; makes t (eax) equal to b (ecx), t = b
		mov		ecx, ebx		; makes b (ecx) equal to a (ebx), b = a
		cdq						; prepares cdx for division
		div	ebx					; divides t by a, (t/a)
		mov		ebx, edx		; makes puts the reminder into a (ebx), a = reminder
		cmp		edx, 0
	jnz loopDiv					; loop while a (reminder) is not 0
		mov		eax, ecx		; moves b into eax to return the value

		pop		ecx				; restore EXC
		pop		edx				; restore EDX
		pop		ebx				; restore EBX
		pop		ebp				; restore EBP
		ret						; return
greatDiv ENDP					

END                             ; end of source code

