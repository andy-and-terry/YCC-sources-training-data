; x86-64 NASM (Linux): 10th Fibonacci number (55) in exit code
global _start
section .text
_start:
    xor rax, rax        ; F0
    mov rbx, 1          ; F1
    mov rcx, 10
.loop:
    mov rdx, rax
    add rdx, rbx
    mov rax, rbx
    mov rbx, rdx
    dec rcx
    jnz .loop
    mov rdi, rax
    mov rax, 60
    syscall
