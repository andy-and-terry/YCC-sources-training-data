; x86-64 NASM: 10th triangular number via n*(n+1)/2
; exit status: 55
section .text
    global _start

_start:
    mov rax, 10
    lea rbx, [rax + 1]
    imul rax, rbx
    shr rax, 1
    mov rdi, rax
    mov rax, 60
    syscall
