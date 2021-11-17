; The program that prompts for and inputs the length,
; width, and height of a box and computes and displays 
; its volume (length * width * height).
; Author:  Arturo A. Serdan
; Date:    05/26/2019

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
len DWORD   ?
wid DWORD   ?
hei DWORD   ?

prompt1 BYTE    "Enter Length", 0
prompt2 BYTE    "Enter Width", 0
prompt3 BYTE    "Enter Height", 0

string  BYTE    40 DUP (?)
resultLbl BYTE  "The volume is", 0
vol     DWORD    11 DUP (?), 0



.CODE
_MainProc PROC
		
		input   prompt1, string, 40      ; read ASCII characters
        atod    string					 ; convert to integer
        mov     len, eax				 ; store in len

        input   prompt2, string, 40      ; repeat for width
        atod    string
        mov     wid, eax

		input   prompt3, string, 40      ; repeat for height
        atod    string
        mov     hei, eax
		
        
		mov		eax, len				; moves length into eax
		mul		wid						; muliplies lenght and width
		mul		hei						; muliplies length*width with height

        dtoa    vol, eax				; convert to ASCII characters
        output  resultLbl, vol			; output label, and volume

        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code

