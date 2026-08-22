; x86-64 NASM: copy bytes from one buffer to another
section .data
    source db "hello", 0
    dest times 6 db 0

section .text
    global _start

_start:
    lea rsi, [source]
    lea rdi, [dest]
    mov rcx, 6
    cld
    rep movsb
    mov rax, 60
    xor rdi, rdi
    syscall
