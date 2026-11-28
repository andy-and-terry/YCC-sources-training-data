; factorial of 5 in rax, iterative
section .text
global _start
_start:
    mov rcx, 5
    mov rax, 1
.next:
    imul rax, rcx
    dec rcx
    jnz .next
    mov rdi, rax
    mov rax, 60
    syscall
