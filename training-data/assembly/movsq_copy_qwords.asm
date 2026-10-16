; x86-64 NASM: copy qwords with rep movsq
; exit status: 30
section .data
    src dq 10, 20, 30
section .bss
    dst resq 3

section .text
    global _start

_start:
    cld
    lea rsi, [src]
    lea rdi, [dst]
    mov rcx, 3
    rep movsq
    mov rdi, [dst + 16]        ; third element
    mov rax, 60
    syscall
