section .text
	global _start
_start:
	mov al,3
	mov bl,2

	mul bl	;this multiplies the value of al by the value in bl (in-place)

	add al,'0'	;convert back to ascii

	mov [result], al 	;store result for later

	mov ecx,msg
	mov ebx,len
	mov ebx, 1 ;stdout
	mov eax,4 ; print
	int 80h;

	mov ecx,result
	mov edx,1
	mov ebx,1 ;stdout
	mov eax,4 ;print	
	int 80h

	mov eax,1
	mov ebx,0
	int 80h

section .data
msg db "result result is: ",0xA
len equ $-msg
segment .bss
result resb 1
