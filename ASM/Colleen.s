default rel
global main
extern printf

section .data
    format db "default rel%1$cglobal main%1$cextern printf%1$c%1$csection .data%1$c    format db %2$c%3$s%2$c,0%1$c%1$c;outside%1$csection .text%1$c_foobar:%1$c    lea rdi, format;%1$c    mov rsi, 10;%1$c    mov rdx, 34;%1$c    lea rcx, format;%1$c    call printf wrt ..plt;%1$c    ret;%1$cmain:%1$c    ;inside%1$c    call _foobar;%1$c    mov rax, 0;%1$c    ret;%1$c%1$c",0

;outside
section .text
_foobar:
    lea rdi, format;
    mov rsi, 10;
    mov rdx, 34;
    lea rcx, format;
    call printf wrt ..plt;
    ret;
main:
    ;inside
    call _foobar;
    mov rax, 0;
    ret;

