; x86-64 NASM: swap two values without a temp register
section .text
    global _start

_start:
    mov rax, 5
    mov rbx, 9
    xor rax, rbx
    xor rbx, rax
    xor rax, rbx
    ; rax now 9, rbx now 5
    mov rdi, rax
    mov rax, 60
    syscall
