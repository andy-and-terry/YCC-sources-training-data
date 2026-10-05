; x86-64 NASM: swap two memory values using xchg through a register
section .data
    a dq 7
    b dq 35

section .text
    global _start

_start:
    mov rax, [a]
    xchg rax, [b]       ; rax = old b, b = old a
    mov [a], rax
    mov rdi, [a]        ; exit with new a (35)
    mov rax, 60
    syscall
