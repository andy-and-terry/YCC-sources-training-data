; x86-64 Linux: compute string length with repne scasb
section .data
msg db "hello", 0
section .text
global _start
_start:
    lea rdi, [rel msg]
    xor al, al
    mov rcx, -1
    repne scasb
    not rcx
    dec rcx          ; rcx = length
    mov rdi, rcx
    mov rax, 60
    syscall
