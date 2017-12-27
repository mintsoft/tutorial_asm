%macro write_string 2 
      mov   eax, 4
      mov   ebx, 1
      mov   ecx, %1
      mov   edx, %2
      int   80h
%endmacro

%macro exit 1
	mov eax,1
	mov ebx,%1
	int 80h
%endmacro

section .text
	global _start

_start:
	write_string msg1,len1
	write_string msg2,len2
	write_string msg3,len3

	exit 0

section .data
msg1 db "Hello Programmers!",0xA
len1 equ $-msg1

msg2 db "welcome to",0xA
len2 equ $-msg2

msg3 db "assembly in nasm",0xA
len3 equ $-msg3
