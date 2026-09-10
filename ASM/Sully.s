default rel
global main
extern fprintf
extern sprintf
extern fopen
extern fclose
extern strlen
extern memcpy
extern execlp
extern fork
extern wait

struc frame
    .fd:  resq 1
    .len: resq 1
    .b:   resb 100
    .c:   resb 100
          resb 8 ; padding: 216 -> 224 (multiple of 16)
endstruc

section .data
    code db "default rel%1$cglobal main%1$cextern fprintf%1$cextern sprintf%1$cextern fopen%1$cextern fclose%1$cextern strlen%1$cextern memcpy%1$cextern execlp%1$cextern fork%1$cextern wait%1$c%1$cstruc frame%1$c    .fd:  resq 1%1$c    .len: resq 1%1$c    .b:   resb 100%1$c    .c:   resb 100%1$c          resb 8 ; padding: 216 -> 224 (multiple of 16)%1$cendstruc%1$c%1$csection .data%1$c    code db %2$c%3$s%2$c,0%1$c    mode db %2$cw%2$c,0%1$c    file db %2$cSully_%5$cd.s%2$c,0%1$c    gcc  db %2$cgcc%2$c,0%1$c    nasm db %2$cnasm%2$c,0%1$c    nflg db %2$c-felf64%2$c,0%1$c    rm   db %2$crm%2$c,0%1$c    rflg db %2$c-f%2$c,0%1$c    flag db %2$c-o%2$c,0%1$c    n    dd %4$d; i = %4$d%1$c%1$csection .text%1$cmain:%1$c    push rbp%1$c    mov rbp, rsp%1$c    sub rsp, frame_size%1$c    mov  rbx, rsp%1$c%1$c    ; decrement n%1$c    dec dword [n]%1$c%1$c    ; build filename%1$c    lea rdi, [rbx + frame.b]%1$c    lea rsi, file%1$c    mov edx, dword [n]%1$c    xor eax, eax%1$c    call sprintf wrt ..plt%1$c%1$c    ; open the file%1$c    lea rdi, [rbx + frame.b]%1$c    lea rsi, mode%1$c    call fopen wrt ..plt%1$c    test rax, rax%1$c    jz .end%1$c    mov [rbx + frame.fd], rax%1$c%1$c    ; write to file%1$c    sub rsp, 16%1$c    mov dword [rsp], 37 ; last arg%1$c    mov rdi, [rbx + frame.fd]%1$c    lea rsi, code%1$c    mov rdx, 10%1$c    mov rcx, 34%1$c    lea r8, code%1$c    mov r9d, dword [n]%1$c    xor eax, eax%1$c    call fprintf wrt ..plt%1$c    add rsp, 16%1$c    mov rdi, [rbx + frame.fd]%1$c    call fclose wrt ..plt%1$c%1$c    ; build exe name%1$c    lea rdi, [rbx + frame.b]%1$c    call strlen wrt ..plt%1$c    mov [rbx + frame.len], rax%1$c    lea rdi, [rbx + frame.c]%1$c    add rdi, 2%1$c    lea rsi, [rbx + frame.b]%1$c    mov rdx, [rbx + frame.len]%1$c    sub rdx, 2%1$c    call memcpy wrt ..plt%1$c    mov byte [rbx + frame.c], 46%1$c    mov byte [rbx + frame.c + 1], 47%1$c    mov rax, [rbx + frame.len]%1$c    lea rdi, [rbx + frame.c]%1$c    mov byte [rdi + rax], 0%1$c%1$c    call fork wrt ..plt%1$c    test eax, eax%1$c    jnz .parent%1$c    ; compile program in child%1$c    call fork wrt ..plt%1$c    test eax, eax%1$c    jnz  .nasm_wait%1$c%1$c    lea rdi, nasm%1$c    lea rsi, nasm%1$c    lea rdx, nflg%1$c    lea rcx, [rbx + frame.b]%1$c    xor r8, r8%1$c    xor eax, eax%1$c    call execlp wrt ..plt%1$c    jmp .end%1$c%1$c.nasm_wait:%1$c    xor rdi, rdi%1$c    call $wait wrt ..plt%1$c%1$c    mov  rax, [rbx + frame.len]%1$c    lea  rdi, [rbx + frame.b]%1$c    mov  byte [rdi + rax - 1], 'o'%1$c%1$c    call fork wrt ..plt%1$c    test eax, eax%1$c    jnz .gcc_wait%1$c%1$c    lea rdi, gcc%1$c    lea rsi, gcc%1$c    lea rdx, [rbx + frame.b]%1$c    lea rcx, flag%1$c    lea r8, [rbx + frame.c]%1$c    xor r9, r9%1$c    xor eax, eax%1$c    call execlp wrt ..plt%1$c    jmp .end %1$c%1$c.gcc_wait:%1$c    xor rdi, rdi%1$c    call $wait wrt ..plt%1$c%1$c    lea rdi, rm%1$c    lea rsi, rm%1$c    lea rdx, rflg%1$c    lea rcx, [rbx + frame.b]%1$c    xor r8, r8%1$c    xor eax, eax%1$c    call execlp wrt ..plt%1$c    jmp .end %1$c%1$c.parent:%1$c    xor rdi, rdi%1$c    call $wait wrt ..plt%1$c    cmp dword [n], 0%1$c    jl .end%1$c    lea rdi, [rbx + frame.c]%1$c    lea rsi, [rbx + frame.c]%1$c    xor rdx, rdx%1$c    xor eax, eax%1$c    call execlp wrt ..plt%1$c%1$c.end:%1$c    xor  eax, eax%1$c    leave ; shorthand for putting back the stack as it was%1$c    ret%1$c%1$c",0
    mode db "w",0
    file db "Sully_%d.s",0
    gcc  db "gcc",0
    nasm db "nasm",0
    nflg db "-felf64",0
    rm   db "rm",0
    rflg db "-f",0
    flag db "-o",0
    n    dd 5 ; i = 5

section .text
main:
    push rbp
    mov rbp, rsp
    sub rsp, frame_size
    mov  rbx, rsp

    ; decrement n
    dec dword [n]

    ; build filename
    lea rdi, [rbx + frame.b]
    lea rsi, file
    mov edx, dword [n]
    xor eax, eax
    call sprintf wrt ..plt

    ; open the file
    lea rdi, [rbx + frame.b]
    lea rsi, mode
    call fopen wrt ..plt
    test rax, rax
    jz .end
    mov [rbx + frame.fd], rax

    ; write to file
    sub rsp, 16
    mov dword [rsp], 37 ; last arg
    mov rdi, [rbx + frame.fd]
    lea rsi, code
    mov rdx, 10
    mov rcx, 34
    lea r8, code
    mov r9d, dword [n]
    xor eax, eax
    call fprintf wrt ..plt
    add rsp, 16
    mov rdi, [rbx + frame.fd]
    call fclose wrt ..plt

    ; build exe name
    lea rdi, [rbx + frame.b]
    call strlen wrt ..plt
    mov [rbx + frame.len], rax
    lea rdi, [rbx + frame.c]
    add rdi, 2
    lea rsi, [rbx + frame.b]
    mov rdx, [rbx + frame.len]
    sub rdx, 2
    call memcpy wrt ..plt
    mov byte [rbx + frame.c], 46
    mov byte [rbx + frame.c + 1], 47
    mov rax, [rbx + frame.len]
    lea rdi, [rbx + frame.c]
    mov byte [rdi + rax], 0

    call fork wrt ..plt
    test eax, eax
    jnz .parent
    ; compile program in child
    call fork wrt ..plt
    test eax, eax
    jnz  .nasm_wait

    lea rdi, nasm
    lea rsi, nasm
    lea rdx, nflg
    lea rcx, [rbx + frame.b]
    xor r8, r8
    xor eax, eax
    call execlp wrt ..plt
    jmp .end

.nasm_wait:
    xor rdi, rdi
    call $wait wrt ..plt

    mov  rax, [rbx + frame.len]
    lea  rdi, [rbx + frame.b]
    mov  byte [rdi + rax - 1], 'o'

    call fork wrt ..plt
    test eax, eax
    jnz .gcc_wait

    lea rdi, gcc
    lea rsi, gcc
    lea rdx, [rbx + frame.b]
    lea rcx, flag
    lea r8, [rbx + frame.c]
    xor r9, r9
    xor eax, eax
    call execlp wrt ..plt
    jmp .end 

.gcc_wait:
    xor rdi, rdi
    call $wait wrt ..plt

    lea rdi, rm
    lea rsi, rm
    lea rdx, rflg
    lea rcx, [rbx + frame.b]
    xor r8, r8
    xor eax, eax
    call execlp wrt ..plt
    jmp .end 

.parent:
    xor rdi, rdi
    call $wait wrt ..plt
    cmp dword [n], 0
    jl .end
    lea rdi, [rbx + frame.c]
    lea rsi, [rbx + frame.c]
    xor rdx, rdx
    xor eax, eax
    call execlp wrt ..plt

.end:
    xor  eax, eax
    leave ; shorthand for putting back the stack as it was
    ret

