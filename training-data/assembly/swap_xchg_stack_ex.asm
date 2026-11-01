; x86-64 NASM: swap two registers, reverse via stack; exit status 2
section .text
    global _start
_start:
    mov rax, 1
    mov rbx, 2
    xchg rax, rbx
    push rax
    push rbx
    pop rax
    pop rbx
    mov rdi, rbx
    mov rax, 60
    syscall
