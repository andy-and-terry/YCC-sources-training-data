; x86-64 NASM: strlen via repne scasb
; exit status: 13
section .data
    msg db "Hello, World!", 0
section .text
    global _start

_start:
    lea rdi, [rel msg]
    mov rcx, -1
    xor al, al
    cld
    repne scasb
    not rcx
    dec rcx
    mov rdi, rcx
    mov rax, 60
    syscall
