; x86-64 NASM: return -1, 0, or 1 based on the sign of a number
section .text
    global _start

_start:
    mov rax, -15
    cmp rax, 0
    jg positive
    jl negative
    mov rdi, 0
    jmp done
positive:
    mov rdi, 1
    jmp done
negative:
    mov rdi, -1
done:
    mov rax, 60
    syscall
