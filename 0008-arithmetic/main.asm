SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1


segment .data
	msg1 db "Enter a Digit", 0xA, 0xD
	len1 equ $- msg1

	msg2 db "Please enter a second digit", 0xA, 0xD
	len2 equ $- msg2

	msg3 db "The sum is : "
	len3 equ $-msg3
segment .bss

	num1 resb 2
	num2 resb 2
	res resb 1
	
section	.text
   global _start    ;must be declared for using gcc
	
_start:             ;tell linker entry point
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg1
	mov edx, len1
	int 80h

	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num1
	mov edx, 2
	int 80h


	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg2
	mov edx, len2
	int 80h

	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num2
	mov edx, 2
	int 80h

;output message before addition is done
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg3
	mov edx, len3
	int 80h

;move the first number to eax and the second to ebx and
; subtracting asciii '0' to convert it from ascii to an integer
; this works because the ASCII codes of '1', '2' etc are their integer values
; plus 48 (which is '0') 

	mov eax, [num1]
	sub eax, '0'

	mov ebx, [num2]
	sub ebx, '0'

	;add them!
	add eax,ebx	; this adds ebx TO eax, not adding the 2 numbers and putting the result somewhere

	add eax, '0' 	; "to convert the sum from decimal to ascii for 1 digit :)"

	mov [res], eax 	;copy the new result into the result memory

	; print the sum!
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, res
	mov edx, 1
	int 80h

	mov eax, SYS_EXIT
	mov ebx, 0
	int 0x80
 
