; x86-64 NASM: count set bits using the POPCNT instruction
; exit status: 16
section .text
    global _start

_start:
    mov rax, 0xFF00FF00
    popcnt rdi, rax
    mov rax, 60
    syscall
