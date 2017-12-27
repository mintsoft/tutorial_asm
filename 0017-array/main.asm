section	.text
   global _start   ;must be declared for linker (ld)
	
_start:	
 		
	mov eax,3
	mov ebx,0
	mov ecx,x	;current element to be summed

top:
	add ebx, [ecx]
	add ecx,1
	dec eax
	jnz top	;if ecx not zero then jump to top

done:
	add ebx,'0' ;to ascii
	mov [sum],ebx ;copy the result into sum

display:
	mov edx,1
	mov ecx,sum
	mov ebx,1
	mov eax,4
	int 80h
	mov eax,1
	mov ebx,0
	int 80h

section .data
global x
x:
	db 2
	db 4
	db 3
sum:
	db 0
