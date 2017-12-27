section	.text
   global _start        ;must be declared for using gcc
	
_start:	                ;tell linker entry point
	call    display
	mov eax,1
	int 80h

display:
	mov ecx,256

next:
	push ecx	; we need ecx for sys_write so store it!

	mov eax,4	;sys_write
	mov ebx,1	;stdout
	mov ecx,achar
	mov edx,1
	int 80h

	pop ecx		; get our ecx back

	mov dx, [achar]
	cmp byte [achar], 0dh
	inc byte [achar]
	loop next	;this looks at the value of ecx!
ret

section .data
achar db '0'
