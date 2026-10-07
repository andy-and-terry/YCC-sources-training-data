; x86-64 NASM: multiply by a power of two using a left shift instead of MUL
section .text
    global _start

_start:
    mov rax, 21            ; value
    mov rcx, 3             ; multiply by 2^3 = 8
    shl rax, cl             ; rax = 21 * 8 = 168
    mov rdi, rax
    mov rax, 60
    syscall
