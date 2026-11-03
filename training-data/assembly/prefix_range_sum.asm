; x86-64 NASM: sum of values[2:5] = 4+1+5
; exit status: 10
section .data
values: db 3, 1, 4, 1, 5, 9, 2, 6

section .text
    global _start

_start:
    xor rdi, rdi
    mov rcx, 2
.loop:
    movzx rax, byte [values + rcx]
    add rdi, rax
    inc rcx
    cmp rcx, 5
    jl .loop
    mov rax, 60
    syscall
