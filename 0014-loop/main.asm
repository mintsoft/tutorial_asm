section	.text
   global _start        ;must be declared for using gcc
	
_start:	

	mov ecx, 10	;this is our number of loops as it's implicitly used as the loop counter
	mov eax, '1'

loop1:
	mov [num], eax

	push ecx	;we want ecx for the loop, but we need that register to output to the screen, so we can push it onto the stack for now

	mov eax, 4	; sys_write
	mov ebx, 1	;stdout
	mov ecx, num	;the variable
	mov edx, 1	; 1 byte to write
	int 80h

	mov eax, [num]	; shove the var into eax so we can do addition etc
	sub eax, '0'	;usual contrived ascii wank
	inc eax		; increment eax in-place
	add eax, '0'	; usual contrived ascii wank

	pop ecx		; OK so we're about to loop, that means we need our ecx value back, this pops it off the stack back into the ecx reg
	loop loop1	; this assume that ecx contains the loop count, it decrements the register when looping until it's 0
			; the loop1 label is where it jumps back to 

;exit()
	mov eax,1	
	mov ebx,0
	int 80h

section .bss
num resb 1
