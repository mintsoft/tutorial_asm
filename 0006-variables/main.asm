section .text
	global _start
_start:
	mov edx,1
	mov ecx,choice
	mov ebx,1,
	mov eax,4
	int 80h

	mov eax,1
	mov ebx,0
	int 80h
section .data
choice db 'y'
