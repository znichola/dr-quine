#include <stdio.h>
/*
   One comment
*/
#define FT(x) int main() {char code[]=S(x);char str[]="#include <stdio.h>%1$c/*%1$c   One comment%1$c*/%1$c#define FT(x) int main() {char code[]=S(x);char str[]=%2$c%3$s%2$c;x;}%1$c#define Q(x) #x%1$c#define S(x) Q(x)%1$c%1$cFT(%4$s)%1$c%1$c";x;}
#define Q(x) #x
#define S(x) Q(x)

FT(FILE *fd=fopen("Grace_kid.c","w");fprintf(fd,str,10,34,str,code);fclose(fd);)

