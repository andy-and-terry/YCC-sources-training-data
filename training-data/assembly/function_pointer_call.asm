; x86-64 NASM: indirect call through a function pointer
; exit status: 14
section .data
    handler dq double_it

section .text
    global _start

double_it:
    lea rax, [rdi + rdi]
    ret

_start:
    mov rdi, 7
    call [handler]
    mov rdi, rax
    mov rax, 60
    syscall
