; x86-64 NASM: convert a numeric string to an integer (atoi)
section .data
    str db "42", 0

section .text
    global _start

_start:
    lea rsi, [str]
    xor rax, rax           ; result = 0
parse_loop:
    movzx rcx, byte [rsi]
    cmp rcx, 0
    je parse_done
    sub rcx, '0'
    imul rax, rax, 10
    add rax, rcx
    inc rsi
    jmp parse_loop
parse_done:
    mov rdi, rax
    mov rax, 60
    syscall
