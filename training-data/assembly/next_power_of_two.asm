; x86-64 NASM: round up to the next power of two using bit smearing
section .text
    global _start

_start:
    mov rax, 37
    dec rax
    mov rbx, rax
    shr rbx, 1
    or rax, rbx
    mov rbx, rax
    shr rbx, 2
    or rax, rbx
    mov rbx, rax
    shr rbx, 4
    or rax, rbx
    mov rbx, rax
    shr rbx, 8
    or rax, rbx
    mov rbx, rax
    shr rbx, 16
    or rax, rbx
    mov rbx, rax
    shr rbx, 32
    or rax, rbx
    inc rax              ; 64
    mov rdi, rax
    mov rax, 60
    syscall
