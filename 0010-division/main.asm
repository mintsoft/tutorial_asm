section .text
	global _start
_start:
	mov ax, 8
	mov bl, 2

	div bl	;divides ax by bl in-place
	add eax, '0'	;convert back to ascii!

	mov [result], ax

;print message
	mov ecx,msg
	mov edx,len
	mov ebx,1 ;stdout
	mov eax,4; write
	int 80h

;print result!
	mov ecx,result
	mov edx,1
	mov ebx,1;stdout
	mov eax,4
	int 80h

	mov eax,1
	mov ebx,0
	int 80h

section .data
msg db "result result is: ",0xA
len equ $-msg

segment .bss
result resb 1
