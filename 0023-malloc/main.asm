section	.text
   global _start         ;must be declared for using gcc
	
_start:	

mov eax, 45	; sys_brk
xor ebx,ebx	;set ebx to 0
int 80h

add eax, 16384	;number of bytes to alloc
mov ebx, eax
mov eax, 45	;sys_brk
int 80h

cmp eax,0	;sets eax to -1 if there was an erro
jl	exit	; if less than 

mov edi, eax	;edi = highest available address
sub edi,4	;location of the highest DWORD (4bytes)
mov ecx,4096	; number of DWORDS allocated (16384/4)
xor eax,eax	;reset eax to 0

; I don't know how this section works::
std	; ---- don't know
rep stosd	;; repeat for entire allocated area??
cld		;put df flag to normal state


mov eax,4
mov ebx,1
mov ecx,msg
mov edx,len
int 80h

exit:
	mov eax,1
	mov ebx,0
	int 80h

section .data
msg	db 	"allocated 16kB of memory!",10
len	equ	$ - msg
