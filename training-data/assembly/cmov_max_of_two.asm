; max(9, 14) with cmov -> exit status 14
section .text
global _start
_start:
    mov rdi, 9
    mov rsi, 14
    cmp rdi, rsi
    cmovl rdi, rsi
    mov rax, 60
    syscall
