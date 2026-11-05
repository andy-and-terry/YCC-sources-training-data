; x86-64 NASM: count set bits with popcnt
; exit status: 8
section .text
    global _start

_start:
    mov rax, 0xFF
    popcnt rdi, rax
    mov rax, 60
    syscall
