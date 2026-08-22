; x86-64 NASM: count set bits (popcount) in a number
section .text
    global _start

_start:
    mov rax, 13         ; number
    xor rbx, rbx         ; count = 0
count_loop:
    cmp rax, 0
    je done
    mov rcx, rax
    and rcx, 1
    add rbx, rcx
    shr rax, 1
    jmp count_loop
done:
    mov rdi, rbx
    mov rax, 60
    syscall
