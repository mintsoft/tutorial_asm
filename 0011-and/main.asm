section .text
   global _start            ;must be declared for using gcc
	
_start:           
	mov ax,8
	and ax,1	;BAND ax with 1 (this will result in 0)
	jz  even	; jump to label evnn IF ax is 0
	
	mov eax,4	;sys_write
	mov ebx,1	;stdout
	mov ecx,odd_msg	;message
	mov edx,odd_msg_len	;length
	int 80h;
	
	jmp outprog

even:
	mov ah,9		;not sure why this is here
	
	mov eax,4	;sys_write
	mov ebx,1	;stdout
	mov ecx,even_msg
	mov edx,even_msg_len
	int 80h

outprog:
	mov eax,1
	mov ebx,0
	int 80h

section .data
even_msg db "Even Number!"
even_msg_len equ $-even_msg

odd_msg db "Odd Number!"
odd_msg_len equ $-odd_msg
