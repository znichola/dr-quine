#include <stdio.h>
// One comment
#define STR "#include <stdio.h>%1$c// One comment%1$c#define STR %2$c%3$s%2$c%1$c#define MAIN int main() {FILE *fd=fopen(%2$cGrace_kid.c%2$c,%2$cw%2$c);fprintf(fd,STR,10,34,STR);fclose(fd);}%1$c#define THREE%1$c%1$cMAIN%1$c%1$c"
#define MAIN int main() {FILE *fd=fopen("Grace_kid.c","w");fprintf(fd,STR,10,34,STR);fclose(fd);}
#define THREE

MAIN

