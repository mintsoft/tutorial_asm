section .text
   global _start            ;must be declared for using gcc
	
_start:                     ;tell linker entry point

	mov ecx, [num1]
	cmp ecx, [num2]
	jg	check_third_num	;Jump Greater or Jump Not Less/Equal
	mov ecx, [num2]	;we're going to compare ecx to num3 in a sec.... 

check_third_num:
	cmp ecx, [num3]
	jg	_exit
	mov ecx, [num3]
_exit:

	mov [largest], ecx
	mov ecx, msg
	mov edx, len
	mov ebx, 1 ;stdout
	mov eax, 4 ; sys_write
	int 80h

	mov ecx,largest
	mov edx,2
	mov ebx,1
	mov eax,4
	int 80h

	mov eax,1
	int 80h

section .data
msg db "The largest number is: ",0xA
len equ $-msg
num1 dd '47'	;dword?
num2 dd '22'
num3 dd '31'

segment .bss
largest resb 2

