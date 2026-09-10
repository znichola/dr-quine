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
    code db "hello my cool program",0
    mode db "w",0
    file db "Sully_%d.s",0
    gcc  db "gcc",0
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
    mov byte [rbx + rax], 0

    call fork wrt ..plt
    test eax, eax
    jnz .parent
    ; compile program in child
    lea rdi, gcc
    lea rsi, gcc
    lea rdx, [rbx + frame.b]
    lea rcx, flag
    lea r8, [rbx + frame.c]
    xor r9, r9
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

