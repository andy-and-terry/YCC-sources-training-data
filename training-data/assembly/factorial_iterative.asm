; x86-64 NASM (Linux): 5! = 120 in exit code
global _start
section .text
_start:
    mov rax, 1
    mov rcx, 5
.loop:
    imul rax, rcx
    dec rcx
    jnz .loop
    mov rdi, rax
    mov rax, 60
    syscall
