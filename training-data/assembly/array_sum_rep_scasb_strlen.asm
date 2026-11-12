; strlen using repne scasb -> exit 5
section .data
s db "hello", 0
section .text
global _start
_start:
    mov rdi, s
    xor al, al
    mov rcx, -1
    repne scasb
    not rcx
    dec rcx
    mov rdi, rcx
    mov rax, 60
    syscall
