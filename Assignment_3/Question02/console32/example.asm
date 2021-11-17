; This program computes in EAX the perimeter (2*length + 2*width)
; of a rectangle where the length and width are in memory
; doublewords.
; Author:  Arturo A. Serdan
; Date:    05/26/2019

.586
.MODEL FLAT

.STACK  4096            ; reserve 4096-byte stack

.DATA                   ; reserve storage for data
len  DWORD   60
wid  DWORD   25
per  DWORD   ?

.CODE                           ; start of main program code
main    PROC
        
		mov     eax, len     ; len number to EAX
		mov		ebx, 2		 ; moves 2 into ebx 
        mul		ebx			 ; multiply length by 2
		mov		per, eax	 ; moves eax into per

		mov		eax, wid	 ; wid to ebx
		mov		ebx, 2		 ; multiply width by 2
		mul		ebx			 ; multiply width by 2
		add		per, eax	 ; adds 2*width into per (2*length + 2*width)


        mov		eax, 0            ; exit with return code 0
        ret
main    ENDP

END                             ; end of source code
