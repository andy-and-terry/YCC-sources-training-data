; x86-64 NASM: tenth hexagonal number, n(2n-1) with n = 10.
; Expected: 190 -> exit code 190
section .text
    global _start

_start:
    mov rax, 10
    lea rbx, [rax*2 - 1]
    imul rax, rbx
    mov rdi, rax
    mov rax, 60
    syscall
