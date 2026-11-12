; lea computes x*5 without imul: 8*5 = 40
section .text
global _start
_start:
    mov rax, 8
    lea rdi, [rax + rax*4]
    mov rax, 60
    syscall
