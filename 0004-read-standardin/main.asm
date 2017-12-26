section .text
	global _start

_start:

	mov eax, 4
	mov ebx, 1
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 80h	;print userMsg

	;read from stdin and store somewhere
	mov eax,3	;fread
	mov ebx,2	;stdin
	mov ecx, num
	mov edx,8	;only read 5 bytes this includes the actual newline of the user pressing enter 
	int 80h
	
	;output the msg before the number input
	mov eax,4
	mov ebx,1
	mov ecx,dispMsg
	mov edx,lenDispMsg
	int 80h
	
	;output the actual number
	mov eax,4
	mov ebx,1
	mov ecx, num
	mov edx, 8
	int 80h

	mov eax,1
	mov ebx,0
	int 80h

section .data
	userMsg db 'Please enter a number: '
	lenUserMsg equ $-userMsg
	dispMsg db 'You have entered: '
	lenDispMsg equ $-dispMsg

section .bss
	num resb 8
