; x86-64 NASM: extract the lowest set bit of a number
section .text
    global _start

_start:
    mov rax, 12          ; 0b1100
    mov rbx, rax
    neg rbx
    and rax, rbx          ; isolates lowest set bit -> 4
    mov rdi, rax
    mov rax, 60
    syscall
