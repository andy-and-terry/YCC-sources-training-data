; x86-64 NASM: the fifth repunit R_5 = 11111, built as r = 10r + 1.
; The exit status is the low 8 bits: 11111 mod 256 = 103 -> exit code 103
section .text
    global _start

_start:
    xor rax, rax
    mov rcx, 5
.build:
    imul rax, 10
    inc rax
    dec rcx
    jnz .build
    and rax, 0xFF
    mov rdi, rax
    mov rax, 60
    syscall
