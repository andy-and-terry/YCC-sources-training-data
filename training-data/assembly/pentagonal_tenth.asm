; x86-64 NASM: tenth pentagonal number, n(3n-1)/2 with n = 10.
; Expected: 145 -> exit code 145
section .text
    global _start

_start:
    mov rax, 10
    lea rbx, [rax*3 - 1]    ; 3n - 1
    imul rax, rbx
    shr rax, 1
    mov rdi, rax
    mov rax, 60
    syscall
