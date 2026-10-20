; x86-64 NASM: bubble sort 5 numbers then return the smallest
; exit status: 1
section .data
    arr dq 5, 3, 8, 1, 9
section .text
    global _start

_start:
    mov rcx, 4              ; passes
outer:
    mov rsi, 0
    mov rdx, rcx
inner:
    mov rax, [arr + rsi*8]
    mov rbx, [arr + rsi*8 + 8]
    cmp rax, rbx
    jle no_swap
    mov [arr + rsi*8], rbx
    mov [arr + rsi*8 + 8], rax
no_swap:
    inc rsi
    dec rdx
    jnz inner
    dec rcx
    jnz outer
    mov rdi, [arr]
    mov rax, 60
    syscall
