; x86-64 NASM: RIP-relative addressing with default rel
; exit status: 77
default rel

section .data
    magic db 77

section .text
    global _start

_start:
    movzx rdi, byte [magic]
    mov rax, 60
    syscall
