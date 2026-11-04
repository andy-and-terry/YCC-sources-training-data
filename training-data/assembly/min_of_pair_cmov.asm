; x86-64 NASM: min(a, b) with cmov
global _start
section .text
_start:
    mov rax, 37
    mov rbx, 21
    cmp rbx, rax
    cmovl rax, rbx
    mov rdi, rax       ; 21
    mov rax, 60
    syscall
