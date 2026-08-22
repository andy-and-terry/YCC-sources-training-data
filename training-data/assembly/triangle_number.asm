; x86-64 NASM: compute the nth triangular number: n*(n+1)/2
section .text
    global _start

_start:
    mov rax, 10          ; n
    mov rbx, rax
    inc rbx
    imul rax, rbx
    xor rdx, rdx
    mov rcx, 2
    div rcx
    mov rdi, rax
    mov rax, 60
    syscall
