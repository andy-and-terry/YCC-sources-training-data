; count set bits of 0xF0F0 -> exit status 8
section .text
global _start
_start:
    mov rax, 0xF0F0
    xor rdi, rdi
.l: test rax, rax
    jz .d
    mov rbx, rax
    and rbx, 1
    add rdi, rbx
    shr rax, 1
    jmp .l
.d: mov rax, 60
    syscall
