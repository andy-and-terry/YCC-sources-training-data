; x86-64 NASM: compare two strings with repe cmpsb (exit 0 if equal)
section .data
    a db "kernel", 0
    b db "kernel", 0

section .text
    global _start

_start:
    lea rsi, [rel a]
    lea rdi, [rel b]
    mov rcx, 7
    cld
    repe cmpsb
    setne dil
    movzx rdi, dil
    mov rax, 60
    syscall
