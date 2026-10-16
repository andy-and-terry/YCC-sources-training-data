; x86-64 NASM: equ constants and the times directive
; exit status: 12
section .data
    ROWS equ 3
    COLS equ 4
    grid times ROWS*COLS db 1

section .text
    global _start

_start:
    lea rsi, [grid]
    xor rdi, rdi
    mov rcx, ROWS * COLS
.sum:
    movzx rax, byte [rsi + rcx - 1]
    add rdi, rax
    loop .sum
    mov rax, 60
    syscall
