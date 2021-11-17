; Program to d calculates the sum and the average
; (sum/4) of the grades.
; Author:  Arturo A. Serdan
; Date:    05/31/2019

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
sum				DWORD   ?
ave				DWORD	?
divisor			DWORD	4

prompt1 BYTE    "Enter first grade", 0
prompt2 BYTE    "Enter second grade", 0
prompt3 BYTE    "Enter third grade", 0
prompt4 BYTE    "Enter fourth grade", 0

string  BYTE    40 DUP (?)
resultLbl BYTE  "The sum and the average are: ", 0
sm		BYTE	11 DUP (?),  " - Sum ", 0ah, 0dh
av		BYTE	11 DUP (?), " - Average ", 0

.CODE
_MainProc PROC
        input   prompt1, string, 40      ; read ASCII characters
        atod    string					 ; convert to integer
        mov     sum, eax					 ; store in memory
		

        input   prompt2, string, 40      ; read ASCII characters
        atod    string					 ; convert to integer
		add		sum, eax				 ; adds eax (2nd grade) to sum

		input   prompt3, string, 40      ; repeat for	grade 3 
        atod    string
		add		sum, eax
        
		input   prompt4, string, 40      ; repeat for grade 4
        atod    string
        add		sum, eax

		mov		eax, sum				; moves sum into eax for divison
		cdq								; prepares EDX for division
		div		divisor					; divides sum/eax by divisor (4)
		mov		ave, eax				; moves quotient into average

       
        
		dtoa	av, ave					; convert to ASCII characters
		dtoa    sm, sum					; convert to ASCII characters
		output  resultLbl, sm 			; output label and sum

        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code

