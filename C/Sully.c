#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>
int main() {
char str[]="#include <stdio.h>%1$c#include <unistd.h>%1$c#include <string.h>%1$c#include <sys/wait.h>%1$cint main() {%1$cchar str[]=%2$c%3$s%2$c;%1$cint n=%4$d;%1$cn--;%1$cchar b[100];%1$csprintf(b,%2$cSully_%5$cd.c%2$c,n);%1$cFILE *fd=fopen(b,%2$cw%2$c);%1$cfprintf(fd,str,10,34,str,n,37);%1$cfclose(fd);%1$cchar c[100];%1$cmemcpy(c+2,b,strlen(b));%1$cc[0]='.';c[1]='/';c[strlen(b)]=0;%1$cif(!fork()) execlp(%2$cgcc%2$c,%2$cgcc%2$c,b,%2$c-o%2$c,c,NULL);%1$celse {wait(NULL);if(n>=0)execlp(c,c,NULL);}%1$c}%1$c";
int n=5;
n--;
char b[100];
sprintf(b,"Sully_%d.c",n);
FILE *fd=fopen(b,"w");
fprintf(fd,str,10,34,str,n,37);
fclose(fd);
char c[100];
memcpy(c+2,b,strlen(b));
c[0]='.';c[1]='/';c[strlen(b)]=0;
if(!fork()) execlp("gcc","gcc",b,"-o",c,NULL);
else {wait(NULL); if(n>=0)execlp(c,c,NULL);}
}
