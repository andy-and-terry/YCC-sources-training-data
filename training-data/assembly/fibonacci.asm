; x86-64 NASM: compute the 10th Fibonacci number iteratively
section .text
    global _start

_start:
    xor rax, rax        ; a = 0
    mov rbx, 1           ; b = 1
    mov rcx, 10          ; n = 10
fib_loop:
    cmp rcx, 0
    jle fib_done
    mov rdx, rax
    add rdx, rbx         ; temp = a + b
    mov rax, rbx          ; a = b
    mov rbx, rdx           ; b = temp
    dec rcx
    jmp fib_loop
fib_done:
    ; rax now holds fib(10) = 55; exit with it as status code
    mov rdi, rax
    mov rax, 60
    syscall
