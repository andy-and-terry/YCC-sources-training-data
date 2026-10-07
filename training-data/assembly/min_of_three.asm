; x86-64 NASM: minimum of three values using CMOVcc
section .text
    global _start

_start:
    mov rax, 42
    mov rbx, 17
    mov rcx, 29
    cmp rbx, rax
    cmovl rax, rbx       ; rax = min(rax, rbx)
    cmp rcx, rax
    cmovl rax, rcx       ; rax = min(rax, rcx)
    mov rdi, rax
    mov rax, 60          ; exit(17)
    syscall
