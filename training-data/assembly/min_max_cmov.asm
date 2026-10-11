; x86-64 NASM: compute max - min of three values using cmov
; exit status: 17
section .text
    global _start

_start:
    mov rax, 9                 ; a
    mov rbx, 22                ; b
    mov rcx, 5                 ; c
    mov rdx, rax               ; rdx = max
    cmp rbx, rdx
    cmovg rdx, rbx
    cmp rcx, rdx
    cmovg rdx, rcx
    mov rsi, rax               ; rsi = min
    cmp rbx, rsi
    cmovl rsi, rbx
    cmp rcx, rsi
    cmovl rsi, rcx
    sub rdx, rsi
    mov rdi, rdx
    mov rax, 60
    syscall
