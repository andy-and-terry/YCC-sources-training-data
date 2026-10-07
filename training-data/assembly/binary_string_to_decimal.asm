; x86-64 NASM: parse a null-terminated binary digit string into an integer
section .data
    bin_str db "1011010", 0

section .text
    global _start

_start:
    lea rsi, [bin_str]
    xor rax, rax                ; result
parse_loop:
    movzx rcx, byte [rsi]
    test rcx, rcx
    jz parse_done
    shl rax, 1
    sub rcx, '0'
    add rax, rcx
    inc rsi
    jmp parse_loop
parse_done:
    mov rdi, rax
    mov rax, 60
    syscall
