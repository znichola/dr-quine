#include <stdio.h>

// Outside comment

void foobar() {
    char str[] = "#include <stdio.h>%1$c%1$c// Outside comment%1$c%1$cvoid foobar() {%1$c    char str[] = %2$c%3$s%2$c;%1$c    printf(str, 10, 34, str);%1$c}%1$c%1$cint main() {%1$c    // Inside comment%1$c    foobar();%1$c}%1$c";
    printf(str, 10, 34, str);
}

int main() {
    // Inside comment
    foobar();
}
