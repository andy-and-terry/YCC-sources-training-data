; x86-64 NASM: rotate the bits of a byte left by 2
section .text
    global _start

_start:
    mov al, 0b10110000
    rol al, 2
    movzx rdi, al
    mov rax, 60
    syscall
