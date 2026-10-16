; x86-64 NASM: iterative Fibonacci using three registers
; exit status: 55
section .text
    global _start

_start:
    mov rcx, 10                ; want fib(10)
    xor rax, rax               ; fib(0)
    mov rbx, 1                 ; fib(1)
.next:
    test rcx, rcx
    jz .done
    lea rdx, [rax + rbx]
    mov rax, rbx
    mov rbx, rdx
    dec rcx
    jmp .next
.done:
    mov rdi, rax
    mov rax, 60
    syscall
