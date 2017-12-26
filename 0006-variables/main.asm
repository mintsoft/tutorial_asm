section .text
	global _start
_start:
	mov edx,9	;length of string
	mov ecx,string
	mov ebx,1,
	mov eax,4
	int 80h

	mov eax,1
	mov ebx,0
	int 80h
section .data
string times 9 db '*'
