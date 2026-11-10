; x86-64 NASM: lazy caterer's sequence (n*n + n + 2) / 2 for n = 10 -> exit code 56
section .text
    global _start

_start:
    mov rax, 10
    mov rbx, rax
    imul rbx, rax        ; n*n
    add rbx, rax         ; + n
    add rbx, 2           ; + 2
    shr rbx, 1           ; / 2
    mov rdi, rbx
    mov rax, 60
    syscall
