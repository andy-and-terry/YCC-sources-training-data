; x86-64 NASM: rotate the bits of a byte right by 2
section .text
    global _start

_start:
    mov al, 0b10110001
    ror al, 2
    movzx rdi, al
    mov rax, 60
    syscall
