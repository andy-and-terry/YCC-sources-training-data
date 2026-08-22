; x86-64 NASM: manually unrolled loop summing 4 fixed values
section .text
    global _start

_start:
    mov rax, 1
    add rax, 2
    add rax, 3
    add rax, 4
    mov rdi, rax
    mov rax, 60
    syscall
