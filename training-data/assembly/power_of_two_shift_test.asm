; x86-64 NASM: is 64 a power of two? (x & (x-1)) == 0
; exit status: 1
section .text
    global _start

_start:
    mov rax, 64
    lea rbx, [rax - 1]
    and rbx, rax
    xor rdi, rdi
    test rbx, rbx
    sete dil
    mov rax, 60
    syscall
