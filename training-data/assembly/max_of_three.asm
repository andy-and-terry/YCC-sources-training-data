; x86-64 NASM: maximum of three signed values using cmov
section .text
    global _start

max3:
    ; rdi, rsi, rdx -> rax = largest
    mov rax, rdi
    cmp rax, rsi
    cmovl rax, rsi
    cmp rax, rdx
    cmovl rax, rdx
    ret

_start:
    mov rdi, 17
    mov rsi, 42
    mov rdx, 8
    call max3
    mov rdi, rax
    mov rax, 60
    syscall
