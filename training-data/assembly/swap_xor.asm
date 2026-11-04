; x86-64 NASM: swap two registers with XOR, no temporary
global _start
section .text
_start:
    mov rax, 12
    mov rbx, 34
    xor rax, rbx
    xor rbx, rax
    xor rax, rbx       ; rax=34, rbx=12
    mov rdi, rax
    mov rax, 60
    syscall
