; x86-64 NASM: string length using REPNE SCASB
section .data
    msg db "assembly", 0

section .text
    global _start

_start:
    lea rdi, [rel msg]
    xor eax, eax         ; search for NUL
    mov rcx, -1          ; max count
    cld
    repne scasb
    not rcx
    dec rcx              ; rcx = length
    mov rdi, rcx
    mov rax, 60          ; exit(8)
    syscall
