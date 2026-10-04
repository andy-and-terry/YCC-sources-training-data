; x86-64 NASM: swap two memory values with xchg
section .data
    first  dq 11
    second dq 22

section .text
    global _start

_start:
    mov rax, [first]
    xchg rax, [second]     ; rax = 22, second = 11
    mov [first], rax       ; first = 22
    mov rdi, [second]      ; exit with 11
    mov rax, 60
    syscall
