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

; this gives us our starting point for the below loop
sub edi,4	;location of the highest DWORD (4bytes)
mov ecx,4096	; number of DWORDS allocated (16384/4)	; this is the implicit iterator of rep
xor eax,eax	;reset eax to 0	- this is the value that stosd will write into edi

std		; this sets the direction flag - opposite of CLD (i.e. makes the operation right to left)
rep stosd	; this repeats until cx is 0; which we set above to be 4096; so this is resetting the 16k we allocated to be
		; 0 in blocks of 4 bytes at a time (presumably at 32 bit, the most efficient way of doing it)
		; but REP actually runs the operation you give it, so we're running STOSD here, which copies EAX to ES:DI (edi for short)
cld		; reset the df (direction flag) to normal state (left to right)

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
