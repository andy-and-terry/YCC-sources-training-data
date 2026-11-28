; simple function call using the System V convention
section .text
global _start

add_two:
    lea rax, [rdi + rsi]
    ret

_start:
    mov rdi, 20
    mov rsi, 22
    call add_two
    mov rdi, rax
    mov rax, 60
    syscall
