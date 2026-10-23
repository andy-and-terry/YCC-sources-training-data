; x86-64 NASM: maximum of three values using cmov (branch-free)
section .text
    global _start

_start:
    mov rax, 17
    mov rbx, 42
    mov rcx, 30
    cmp rax, rbx
    cmovl rax, rbx
    cmp rax, rcx
    cmovl rax, rcx
    mov rdi, rax
    mov rax, 60
    syscall
