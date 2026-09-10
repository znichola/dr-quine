default rel
global main
extern fprintf
extern fopen
extern fclose

section .data
    code db "hello my cool program",0
    mode db 119,0
    file db "Sully_%d.s",0

section .text
main:
    sub rsp, 8

    

    ; make file name

    ; make the file
    lea rdi, file
    lea rsi, mode
    call fopen wrt ..plt
    test rax, rax
    jz .end
    mov rdi, rax
    push rax
    push 0
    lea rsi, code
    mov rdx, 10
    mov rcx, 34
    lea r8, code
    mov r9, 37
    mov rax, 0
    call fprintf wrt ..plt
    pop rdi
    pop rdi
    call fclose wrt ..plt

    ; make 

.end:
    add rsp, 8
    mov rax, 0
    ret

