; x86-64 NASM: binary to Gray code (n ^ (n >> 1)); 13 -> 11
section .text
    global _start

_start:
    mov edi, 13
    mov eax, edi
    shr eax, 1
    xor edi, eax
    mov rax, 60
    syscall
