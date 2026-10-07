; x86-64 NASM: fill a buffer with REP STOSB, then sum it
section .bss
    buf resb 8

section .text
    global _start

_start:
    lea rdi, [rel buf]
    mov al, 3
    mov rcx, 8
    cld
    rep stosb            ; buf[0..7] = 3
    lea rsi, [rel buf]
    mov rcx, 8
    xor rdi, rdi
.sum:
    movzx rax, byte [rsi]
    add rdi, rax
    inc rsi
    loop .sum
    mov rax, 60          ; exit(24)
    syscall
