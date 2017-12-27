section	.text
   global _start         ;must be declared for using gcc
	
_start:

mov eax,8	;sys_creat
mov ebx, file_name	;const char * filename
mov ecx, 0777		; int permissions
int 80h

mov [fd_out], eax ;eax contains the file descriptor for the created file

;write content to file
mov edx,len
mov ecx,msg
mov ebx,[fd_out]
mov eax,4	;sys_write, except for fd_out instead of 1 (stdout)
int 80h

mov eax,6	;sys_close
mov ebx, [fd_out];	unsigned int file_descriptor

mov eax, 4
mov ebx,1
mov ecx,msg_done
mov ecx,len_done
int 80h

mov eax,5	;sys_open
mov ebx, file_name 	;const char * filename
mov ecx, 0		;mode flag, 0 == 'r'
mov edx, 0777		;permissions
int 80h

mov [fd_in], eax	;again eax contains the file descriptor

;read from file :)

mov eax,3	;sys_read
mov ebx,[fd_in]	;unsigned int file_descriptor
mov ecx, info
mov edx, 26
int 80h

;close the file
mov eax,6
mov ebx, [fd_in]

; print the info
mov eax,4
mov ebx,1
mov ecx,info
mov edx, 26
int 80h

mov eax,1
mov ebx,0
int 80h

section .data
file_name db 'myfile.txt',0
msg db 'This is some content for the file :)'
len equ $-msg

msg_done db 'Written to file',0xA
len_done equ $-msg_done

section .bss
fd_out resb 1
fd_in resb 1
info resb 26

