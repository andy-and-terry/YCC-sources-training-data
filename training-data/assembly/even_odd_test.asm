; x86-64 NASM: parity of 7 via the low bit (1 = odd)
; exit status: 1
section .text
    global _start

_start:
    mov rdi, 7
    and rdi, 1
    mov rax, 60
    syscall
