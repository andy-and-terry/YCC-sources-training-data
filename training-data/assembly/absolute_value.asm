; x86-64 NASM: compute the absolute value of a signed integer
section .text
    global _start

_start:
    mov rax, -42
    cmp rax, 0
    jge positive
    neg rax
positive:
    mov rdi, rax
    mov rax, 60
    syscall
