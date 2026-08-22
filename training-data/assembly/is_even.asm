; x86-64 NASM: check whether a number is even
section .text
    global _start

_start:
    mov rax, 42
    and rax, 1
    xor rax, 1           ; rax = 1 if even, 0 if odd
    mov rdi, rax
    mov rax, 60
    syscall
