; Program to evaluate the expression -(x + y - 2z +1) 
; for doubleword values from an input
; Author:  Arturo A. Serdan
; Date:    05/26/2019

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
x DWORD   ?
y DWORD   ?
z DWORD   ?
prompt1 BYTE    "Enter x", 0
prompt2 BYTE    "Enter y", 0
prompt3 BYTE    "Enter z", 0
string  BYTE    40 DUP (?)
resultLbl BYTE  "The result for the expression", 0
expr     BYTE    11 DUP (?), 0

.CODE
_MainProc PROC
        input   prompt1, string, 40      ; read ASCII characters
        atod    string          ; convert to integer
        mov     x, eax    ; store in memory

        input   prompt2, string, 40      ; repeat for y
        atod    string
        mov     y, eax

		input   prompt3, string, 40      ; repeat for z
        atod    string
        mov     z, eax

        
		mov eax, x
		add eax, y
		mov ebx, z
		add ebx, ebx
		sub eax, ebx
		inc eax
		neg eax

		dtoa    expr, eax			 ; convert to ASCII characters
        output  resultLbl, expr          ; output label and expression
		
        

        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code

