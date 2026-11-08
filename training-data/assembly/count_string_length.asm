; x86-64 NASM (Linux): strlen of "assembly" = 8
global _start
section .data
msg db "assembly", 0
section .text
_start:
    lea rsi, [msg]
    xor rcx, rcx
.loop:
    cmp byte [rsi + rcx], 0
    je .done
    inc rcx
    jmp .loop
.done:
    mov rdi, rcx
    mov rax, 60
    syscall
