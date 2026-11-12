; sum 1..10 -> exit status 55
section .text
global _start
_start:
    xor rdi, rdi
    mov rcx, 10
.l: add rdi, rcx
    loop .l
    mov rax, 60
    syscall
