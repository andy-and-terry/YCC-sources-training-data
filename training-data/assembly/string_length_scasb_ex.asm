; x86-64 NASM: strlen via repne scasb; exit status 5
section .data
msg db "hello", 0
section .text
    global _start
_start:
    lea rdi, [msg]
    xor al, al
    mov rcx, -1
    repne scasb
    not rcx
    dec rcx
    mov rdi, rcx
    mov rax, 60
    syscall
