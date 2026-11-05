; x86-64 NASM: write(1, msg, len) using an assembly-time length
; exit status: 0
section .data
msg: db "hello", 10
len: equ $ - msg
section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel msg]
    mov rdx, len
    syscall
    mov rax, 60
    xor rdi, rdi
    syscall
