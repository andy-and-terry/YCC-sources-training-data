; x86-64 NASM: compute n mod m
section .text
    global _start

_start:
    mov rax, 47
    mov rcx, 5
    xor rdx, rdx
    div rcx
    mov rdi, rdx
    mov rax, 60
    syscall
