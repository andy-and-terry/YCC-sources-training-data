; x86-64 NASM: write a greeting to stdout then exit 0
; exit status: 0
section .data
    msg db "hello from nasm", 10
    len equ $ - msg
section .text
    global _start

_start:
    mov rax, 1              ; sys_write
    mov rdi, 1              ; stdout
    lea rsi, [rel msg]
    mov rdx, len
    syscall
    xor rdi, rdi
    mov rax, 60
    syscall
