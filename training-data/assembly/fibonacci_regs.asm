; compute fib(10) using two registers
section .text
global _start
_start:
    xor rax, rax
    mov rbx, 1
    mov rcx, 10
.step:
    mov rdx, rax
    add rdx, rbx
    mov rax, rbx
    mov rbx, rdx
    loop .step
    mov rdi, rax
    mov rax, 60
    syscall
