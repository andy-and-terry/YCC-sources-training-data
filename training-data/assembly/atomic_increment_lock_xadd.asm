; x86-64 NASM: atomic fetch-and-add
; exit status: 12
section .data
    counter dq 5

section .text
    global _start

_start:
    mov rax, 7
    lock xadd [counter], rax   ; rax = old (5), counter = 12
    mov rdi, [counter]
    mov rax, 60
    syscall
