; x86-64 NASM: branchless max with cmovg
; exit status: 42
section .text
    global _start

_start:
    mov rax, 17
    mov rbx, 42
    cmp rax, rbx
    cmovl rax, rbx
    mov rdi, rax
    mov rax, 60
    syscall
