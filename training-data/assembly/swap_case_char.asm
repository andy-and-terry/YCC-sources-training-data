; x86-64 NASM: flip the case of 'a' by XOR with 0x20
; exit status: 65 ('A')
section .text
    global _start

_start:
    mov rdi, 'a'
    xor rdi, 0x20
    mov rax, 60
    syscall
