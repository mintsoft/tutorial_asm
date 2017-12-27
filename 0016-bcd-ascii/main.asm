section	.text
   global _start        ;must be declared for using gcc

_start:	
mov esi,4	;esi is the extended Source Index (used as source index for string ops)
mov ecx,5	; loop iterator, counts down
clc		;compare logical characters (whatever that means)

add_loop:
	mov al, [num1+esi]	; copies into al, the value of the nth character (esi being n) of num1
	adc al, [num2+esi]	; adds onto al the value of the nth character (esi being n) of num2
	aaa			; ASCII Adjust After Addition - operates on al
	pushf			; we want the value of something for later
	or al, 30h		; convert al to ascii?
	popf			; we want our saved value back

	mov [sum+esi],al	; using our sum buffer copy the nth digit from al into the buffer
	dec esi			; decrement our string index (move along one char)
	loop add_loop		; go back to the start with a reduced ecx

mov edx,len
mov ecx,msg
mov ebx, 1;stdout
mov eax, 4;sys_write
int 80h

; output sum
mov edx,5
mov ecx,sum
mov ebx,1
mov eax,4
int 80h

; exit ()
mov eax,1
mov ebx,0
int 80h

section .data
msg db 'The sum is: ',0xA
len equ $- msg
num1 db '12345'
num2 db '23456'
sum db '     '
