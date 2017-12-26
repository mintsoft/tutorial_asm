section .text
	global _start	;required for linker

_start:		;main function equiv
	mov	edx,len	; edx is extended data register, len is the label?
	mov	ecx,msg ; ecx is extended counter register, msg is the label?
	mov ebx,1	; ebx is extended base register, 1 is the file descriptor (stdout)
	mov eax,4	; eax is extended accumulator , 4 is system call (sys_write)
	int	0x80	; call kernel

;sys_write (eax, ebx, ecx, edx) => sys_write (4, 1, char*, len(char*) ?)
	mov	edx,starlen	; message length ?
	mov	ecx,stars	; message to write?
	mov	ebx,1	; 1 is stdout
	mov	eax,4	; (sys_write)
	int	0x80

;output a new line
	mov edx,1
	mov ecx,nl
	mov ebx,1
	mov eax,4
	int 0x80

	mov	eax,1	;sys_ext
	int	0x80

section .data
msg db 'Displaying 9 stars',0xa	; a message - 0xa is NEW LINE!!!
len equ $ - msg ; length of message
stars times 9 db '9'	;repeats string?
starlen equ $ - stars ; length of stars
nl db 0xa	;newline
