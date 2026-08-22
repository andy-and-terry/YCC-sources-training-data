; x86-64 NASM: check if a number is a power of two
section .text
    global _start

_start:
    mov rax, 16
    mov rbx, rax
    dec rbx
    and rax, rbx        ; n & (n-1)
    cmp rax, 0
    je is_power
    mov rdi, 0
    jmp done
is_power:
    mov rdi, 1
done:
    mov rax, 60
    syscall
