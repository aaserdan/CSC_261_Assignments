; Program to evaluate the harmonic mean of two numbers
; 2xy / x + y
; Author:  Arturo A. Serdan
; Date:    05/31/2019

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
x	DWORD   ?
y	DWORD   ?
fx	DWORD	?

prompt1 BYTE    "Enter x integer ", 0
prompt2 BYTE    "Enter y integer", 0
string  BYTE    40 DUP (?)
resultLbl BYTE  "The is the harmonic mean",0
expr     BYTE   11 DUP (?), 0
hMeanOut BYTE	"Harmonic value is ", 0ah, 0dh, 3 DUP (?), ".", '?', 0


.CODE
_MainProc PROC
        input   prompt1, string, 40      ; read ASCII characters
        atod    string          ; convert to integer
        mov     x, eax    ; store in memory

        input   prompt2, string, 40      ; repeat for second number
        atod    string
        mov     y, eax
        
        
		imul x							; multiplies y*x
		mov ebx, 20						; moves 20 into ebx to  multiply
		imul ebx						; multiplies xy by 20 in order to add an extra decimal when converting to ASCII

		mov fx, eax						; moves result into fx
		cdq								; prepares edx for division
		mov	ebx, x						; moves x into ebx
		add	ebx, y						; adds x +y
		idiv ebx						; divides 20*x*y by x+y 

		mov fx, eax						; moves the result into fx

		dtoa    expr, eax				; convert to ASCII characters
        
		lea eax, expr
		lea ebx, hMeanOut
		mov dl, [eax+10]
		mov [ebx+24], dl
		mov	dl, [eax+9]
		mov [ebx+22], dl
		mov dl, [eax+8]
		mov [ebx+21], dl
		mov dl, [eax+7]
		mov [ebx+20], dl

		output  resultLbl , hMeanOut    ; output label and expression



        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code

