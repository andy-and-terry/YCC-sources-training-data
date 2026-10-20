; x86-64 NASM: tenth Fibonacci number iteratively
; exit status: 55
section .text
    global _start

_start:
    xor rax, rax            ; a = 0
    mov rbx, 1              ; b = 1
    mov rcx, 10
fib_loop:
    mov rdx, rax
    add rdx, rbx
    mov rax, rbx
    mov rbx, rdx
    dec rcx
    jnz fib_loop
    mov rdi, rax
    mov rax, 60
    syscall
