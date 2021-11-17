;Program to evaluate the expression 
;f(x, y, z) = x^4 + y^3 + z + z*(x + y)^4
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
f DWORD	  ?
xy DWORD  ?
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

		mov eax, x						 ; moves x into eax to multiply x to get x^4
		imul x							 
		imul x							 
		imul x							 
		mov f, eax						 ; moves the result in eax to f


		mov eax, y						 ; moves y into eax to multiply to get y^3
		imul y
		imul y
		add f, eax						 ; adds content in eax into f (x^4 + y^3)

		mov eax, x						 ; moves x into eax, and adds y to get (x+y)
		add eax, y

		mov xy, eax						 ; moves (x+y) into xy 
		imul xy							 ; multiply to get (x+y)^4
		imul xy
		imul xy
		imul z							 ; muliply (x+y)^4 with z						


		add f, eax						 ; adds z(x+y)^4 into the f function
		mov eax, z						 ;moves z to eax to add to f
		add f, eax
		
		mov eax, f						 ; moves f into eax

        dtoa    expr, eax				 ; convert to ASCII characters
        output  resultLbl, expr          ; output label, and expression

        mov     eax, 0					 ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code

