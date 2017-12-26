section .text
   global _start            ;must be declared for using gcc
	
_start:                     ;tell linker entry point
	mov al,5
	mov bl,3

	or al,bl	; or's the al with bl register leaving the result in al
	
	add al, byte '0'	; to_ascii

	mov [result], al	; store for later :)

	mov eax,4
	mov ebx,1
	mov ecx, result
	mov edx,1

	int 80h

outprog:
	mov eax,1
	mov ebx,0
	int 80h

section .bss
result resb 1


