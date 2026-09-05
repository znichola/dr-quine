#include <stdio.h>
#include <unistd.h>
int main() {
char str[]="#include <stdio.h>%1$c#include <unistd.h>%1$cint main() {%1$cchar str[]=%2$c%3$s%2$c;%1$cint n=%4$d;%1$cchar b[100];%1$csprintf(b,%2$cSully_%5$cd.c%2$c,n);%1$cFILE *fd=fopen(b,%2$cw%2$c);%1$cfprintf(fd,str,10,34,str,n-1,37);%1$cfclose(fd);%1$cif (n<0) return 0;%1$cchar *a[]={%2$c-c%2$c,%2$c'echo $0 -o $0 && ./$0'%2$c,b,0};%1$cexecve(%2$cbash%2$c,a,NULL);%1$c}%1$c";
int n=5;
char b[100];
sprintf(b,"Sully_%d.c",n);
FILE *fd=fopen(b,"w");
fprintf(fd,str,10,34,str,n-1,37);
fclose(fd);
if (n<0) return 0;
char *a[]={"-c","'echo $0 -o $0 && ./$0'",b,0};
execve("bash",a,NULL);
}
