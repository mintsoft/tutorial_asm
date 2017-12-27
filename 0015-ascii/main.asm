section	.text
   global _start        ;must be declared for using gcc
	
_start:
	sub ah, ah	; 0-out ah?
	mov al, '9'	; shove ASCII 9 in al
	sub al, '3'	; subtract ASCII 3 from ASCII 9 (leaving actual 6)
	aas		; according to the internet this should only be needed when AL contains a two-BCD-digit byte result
	or al, 0x30	; does a BOR on 0x30 (which is '0')
	mov [result], ax	; I presume ax is the output of the above or

;print msg
	mov edx,len
	mov ecx,msg
	mov ebx,1
	mov eax,4
	int 80h

;print the value of result!
	mov edx,1
	mov ecx,result
	mov ebx,1
	mov eax,4
	int 80h

;exit()
	mov eax,1
	mov ebx,0
	int 80h

section .data
msg db "The result is:",0xA
len equ $-msg

section .bss
result resb 1

