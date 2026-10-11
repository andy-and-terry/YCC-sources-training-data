; x86-64 NASM: test a specific bit with bt
; exit status: 1
section .text
    global _start

_start:
    mov rax, 0b101000
    xor rdi, rdi
    bt rax, 5
    setc dil                   ; dil = bit 5
    mov rax, 60
    syscall
