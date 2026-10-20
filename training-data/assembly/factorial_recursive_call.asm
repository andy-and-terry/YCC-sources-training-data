; x86-64 NASM: recursive factorial of 5 using the stack
; exit status: 120
section .text
    global _start

fact:
    cmp rdi, 1
    jle .base
    push rdi
    dec rdi
    call fact
    pop rdi
    imul rax, rdi
    ret
.base:
    mov rax, 1
    ret

_start:
    mov rdi, 5
    call fact
    mov rdi, rax
    mov rax, 60
    syscall
