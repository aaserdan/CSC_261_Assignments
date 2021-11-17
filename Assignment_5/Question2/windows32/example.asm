; A recursive algorithm to find the n^th Fibonacci number.
; Author:  Arturo A. Serdan
; Date:    06/07/2019
.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
n DWORD		?
x DWORD		?
y DWORD		?

prompt1 BYTE    "Enter number", 0
string  BYTE    40 DUP (?)
resultLbl BYTE  "The Fibonacci number is", 0
fib     BYTE    11 DUP (?), 0

;Displayed if an error occurs
ErrorRest BYTE	"An error occurred", 0
wrongInt  BYTE	"Wrong integer input",0

.CODE
_MainProc PROC
        input   prompt1, string, 40      ; read ASCII characters
        atod    string          ; convert to integer
        mov     n, eax			; store in memory
		cmp		eax, 0			; compares a and 0
		jnge	errorCode				; if a is less than 0

		push n					; push n
		call Fibonacci				; fib(n)
		add esp, 4				; remove parameter from stack

        dtoa    fib, eax        ; convert to ASCII characters
        output  resultLbl, fib	; output label and fib
		cmp		eax,eax			; compares to itself to exit
		je		exitCode		; jumps to exitCode
	
	errorCode:	
		output  ErrorRest, wrongInt          ; error output&label

	exitCode:
        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP

; Recursively calculates the Fibonacci number of n.
; fin(n)
; if(n==0 or n==1) return n. else fib(n-1) + fib(n-2).
Fibonacci PROC
		push	ebp				; save base pointer	
		mov		ebp, esp		; establish stack frame
		push	ebx				; saves EBX
		push	edx				; save EDX
	
		mov		eax, [ebp+8]	; get address of n
		cmp		eax, 1			; compares n(eax) to 1
		jnle	elseB			; if n<= 1
		cmp		eax, eax		; compares eax to itself
		je		exCode			; jumps to exit

	elseB:
		mov		edx, eax		; moves n into edx
		sub		eax, 1			; does n-1 in eax
		push	eax				; push n-1 (eax)
		call	Fibonacci		; fib (n-1)
		add		esp, 4			; remove parameter from stack
		mov		ebx, eax		; saves result into ebx

		mov		eax, edx		; moves n into eax
		sub		eax, 2			; decreases by to to get n-2
		push	eax				; push n-2(eax)
		call	Fibonacci		; fin(n-2)
		add		esp, 4			; remove parameter from stack
		add		eax, ebx		; adds fib(n-1) and fib(n-2)

	exCode:		
		pop		edx				; restore registers
		pop		ebx				; restore registers
		pop		ebp				; restore EBP
		ret
Fibonacci	ENDP

END                             ; end of source code

