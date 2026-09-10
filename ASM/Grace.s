default rel
global main
extern fprintf
extern fopen
extern fclose

; one comment

%macro MAIN 0
sub rsp, 8

lea rdi, file
lea rsi, mode
call fopen wrt ..plt
mov rdi, rax
push rax
push 0

PRINT

pop rdi
pop rdi
call fclose wrt ..plt

END
%endmacro

%macro END 0
add rsp, 8
mov rax, 0
ret
%endmacro

%macro PRINT 0
lea rsi, code
mov rdx, 10
mov rcx, 34
lea r8, code
mov r9, 37
mov rax, 0
call fprintf wrt ..plt
%endmacro

section .data
code db "default rel%1$cglobal main%1$cextern fprintf%1$cextern fopen%1$cextern fclose%1$c%1$c; one comment%1$c%1$c%4$cmacro MAIN 0%1$csub rsp, 8%1$c%1$clea rdi, file%1$clea rsi, mode%1$ccall fopen wrt ..plt%1$cmov rdi, rax%1$cpush rax%1$cpush 0%1$c%1$cPRINT%1$c%1$cpop rdi%1$cpop rdi%1$ccall fclose wrt ..plt%1$c%1$cEND%1$c%4$cendmacro%1$c%1$c%4$cmacro END 0%1$cadd rsp, 8%1$cmov rax, 0%1$cret%1$c%4$cendmacro%1$c%1$c%4$cmacro PRINT 0%1$clea rsi, code%1$cmov rdx, 10%1$cmov rcx, 34%1$clea r8, code%1$cmov r9, 37%1$cmov rax, 0%1$ccall fprintf wrt ..plt%1$c%4$cendmacro%1$c%1$csection .data%1$ccode db %2$c%3$s%2$c,0%1$cmode db 119,0%1$cfile db %2$cGrace_kid.s%2$c,0%1$c%1$csection .text%1$c%1$cmain:%1$cMAIN%1$c",0
mode db 119,0
file db "Grace_kid.s",0

section .text

main:
MAIN
