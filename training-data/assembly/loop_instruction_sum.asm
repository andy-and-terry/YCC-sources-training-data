; x86-64 NASM: sum 1..10 using the loop instruction
; exit status: 55
section .text
    global _start

_start:
    xor rax, rax
    mov rcx, 10
.again:
    add rax, rcx
    loop .again
    mov rdi, rax
    mov rax, 60
    syscall
