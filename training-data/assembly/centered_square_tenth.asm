; x86-64 NASM: tenth centered square number, n^2 + (n+1)^2 with n = 9.
; Expected: 181 -> exit code 181
section .text
    global _start

_start:
    mov rax, 9
    mov rbx, rax
    imul rax, rax           ; n^2
    inc rbx
    imul rbx, rbx           ; (n+1)^2
    add rax, rbx
    mov rdi, rax
    mov rax, 60
    syscall
