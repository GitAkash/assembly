section .text:
	global _start

_start:
	pop	eax		; Get the number of arguments
	pop	ebx		; Get the program name
	pop	ebx		; Get the first actual argument, replace progam name in memory.
	pop	ecx		; Get the second actual argument
	pop	edx		; Get the thirt actual argument

	mov	eax,1		; sys_exit
	mov	ebx,0		; Error code 0
	int	80h		; Call kernel
