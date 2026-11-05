; x86-64 NASM: index of highest set bit via bsr
; exit status: 9
section .text
    global _start

_start:
    mov rax, 0x200
    bsr rdi, rax
    mov rax, 60
    syscall
