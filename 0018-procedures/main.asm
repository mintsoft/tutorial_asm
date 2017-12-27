section	.text
   global _start        ;must be declared for using gcc
	
_start:
;input values
	mov ecx,4
	mov edx,5

;actual invocation
	call sum
	mov [res], eax

; output message
	mov ecx,msg
	mov edx, len
	mov ebx, 1	;stdout
	mov eax,4	;sys_write
	int 80h	

;output sum
	mov ecx,res
	mov edx,1
	mov ebx,1	;stdout
	mov eax,4	;sys_write
	int 80h

;exit(0)
	mov eax,1
	mov ebx,0
	int 80h

sum:
	mov eax,ecx
	add eax,edx
	add eax, '0'	; to ascii
	ret

section .data
	msg db "The sum is: ",0xA
	len equ $- msg
	
segment .bss
	res resb 1
