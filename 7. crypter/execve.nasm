;Swaroop Yermalkar
;Execve program
global _start

section .text

_start:

xor eax,eax
push eax

xor ebx,ebx

push 0x68732f6e  
push 0x69622f2f

mov ebx,esp

push eax
mov ecx,esp

push ebx
mov edx,esp

mov al,11
int 0x80
