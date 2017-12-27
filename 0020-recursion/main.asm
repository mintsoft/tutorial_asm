section	.text
   global _start         ;must be declared for using gcc
	
_start: 

mov bx, 3
call proc_fact
add ax,'0'
mov [fact],ax

mov edx,len
mov ecx,msg
mov ebx,1
mov eax,4
int 80h

mov edx,1
mov ecx,fact
mov ebx,1
mov eax,4
int 80h

mov eax,1
mov ebx,0
int 80h

proc_fact:
	cmp bl,1	;compare to 1
	jg	do_calculation	;jump if greater
	mov al,1	;0 factorial is 1
	ret		;return control to where it was CALLED, NOT jump'd

do_calculation:
	dec	bl
	call proc_fact
	inc bl
	mul bl	;ax = al * bl
	ret	;return

section .data
msg db '3! is : ',0xA
len equ $-msg

section .bss
fact resb 1

