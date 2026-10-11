; x86-64 NASM: write a string to stdout with sys_write
; exit status: 0
section .data
    msg db "Hello, assembly!", 10
    len equ $ - msg

section .text
    global _start

_start:
    mov rax, 1                 ; sys_write
    mov rdi, 1                 ; stdout
    lea rsi, [msg]
    mov rdx, len
    syscall
    mov rax, 60
    xor rdi, rdi
    syscall
