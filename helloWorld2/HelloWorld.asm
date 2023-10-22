section .data:
	msg:	db	'Hello, brave new world!', 0Ah

section .text
	global _start

_start:
	mov ebx, msg		; Move the adress of message into EBX
	mov eax, ebx		; move the adress of EBX into EAX,
				;  (both now point to the same segment in memory)
nextchar:
	cmp byte [eax], 0	; Compare the byte pointed to by EAX at this adress against zero
				;  (Zero is end of string delimiter) <-- How does it end up at 0!?!?
	jz  finished		; Jump (if the zero flagged has been set) to the label 'finished'
	inc eax			; Increment the adress in EAX by one byte (if the zero flagged has NOT been set)
	jmp nextchar		; jump to the point in the code labeled 'nextchar'

finished:
	sub eax, ebx		; Subtract the adress in EBX from the adress in EAX
				; Remember both registers started pointing to the same adress (line 9)
				;  but EAX has been incremented by one byte for each character in 'msg'
				; When you substract one memory adress from another of the same type the result
				;  is number of segments between them - in this case the number of bytes

	mov edx, eax		; EAX now equals the number of bytes in our string
	mov ecx, msg
	mov ebx, 1		; stdout
	mov eax, 4		; sys_write
	int 80h			; call kernel

	mov eax, 1		; sys_exit
	mov ebx, 0		; Exit with return code of 0
	int 80h			; call kernel
