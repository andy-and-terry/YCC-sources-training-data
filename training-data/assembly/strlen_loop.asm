; x86-64 Linux: compute length of a NUL-terminated string
section .data
msg db "hello", 0

section .text
global _start
_start:
    lea rsi, [rel msg]
    xor rcx, rcx
.loop:
    cmp byte [rsi + rcx], 0
    je .done
    inc rcx
    jmp .loop
.done:
    mov rdi, rcx        ; exit code = length
    mov rax, 60
    syscall
