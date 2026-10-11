; x86-64 NASM: standard prologue/epilogue with a local variable
; exit status: 49
section .text
    global _start

square_local:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov [rbp - 8], rdi         ; local copy
    mov rax, [rbp - 8]
    imul rax, [rbp - 8]
    leave
    ret

_start:
    mov rdi, 7
    call square_local
    mov rdi, rax
    mov rax, 60
    syscall
