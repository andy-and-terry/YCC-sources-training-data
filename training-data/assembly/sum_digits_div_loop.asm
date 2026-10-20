; x86-64 NASM: sum of decimal digits of 98765
; exit status: 35
section .text
    global _start

_start:
    mov rax, 98765
    mov rcx, 10
    xor rdi, rdi
digit_loop:
    xor rdx, rdx
    div rcx
    add rdi, rdx
    test rax, rax
    jnz digit_loop
    mov rax, 60
    syscall
