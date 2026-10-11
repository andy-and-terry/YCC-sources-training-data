; x86-64 NASM: sum bytes of a buffer using lodsb
; exit status: 15
section .data
    buf db 1, 2, 3, 4, 5
    len equ $ - buf

section .text
    global _start

_start:
    cld
    lea rsi, [buf]
    mov rcx, len
    xor rdi, rdi
.loop:
    lodsb
    movzx rax, al
    add rdi, rax
    loop .loop
    mov rax, 60
    syscall
