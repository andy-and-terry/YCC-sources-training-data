; x86-64 NASM: branchless abs(-42) using the sign mask
global _start
section .text
_start:
    mov rax, -42
    mov rdx, rax
    sar rdx, 63
    xor rax, rdx
    sub rax, rdx
    mov rdi, rax       ; 42
    mov rax, 60
    syscall
