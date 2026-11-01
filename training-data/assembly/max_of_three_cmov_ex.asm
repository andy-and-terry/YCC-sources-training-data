; x86-64 NASM: max(17, 42, 29) using cmov; exit status 42
section .text
    global _start
_start:
    mov rdi, 17
    mov rax, 42
    mov rbx, 29
    cmp rdi, rax
    cmovl rdi, rax
    cmp rdi, rbx
    cmovl rdi, rbx
    mov rax, 60
    syscall
