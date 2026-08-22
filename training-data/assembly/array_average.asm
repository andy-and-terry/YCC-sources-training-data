; x86-64 NASM: compute the average of an array of integers
section .data
    array dq 5, 3, 8, 1, 9, 2
    count equ 6

section .text
    global _start

_start:
    xor rax, rax
    xor rcx, rcx
sum_loop:
    cmp rcx, count
    jge sum_done
    add rax, [array + rcx * 8]
    inc rcx
    jmp sum_loop
sum_done:
    xor rdx, rdx
    mov rcx, count
    div rcx
    mov rdi, rax
    mov rax, 60
    syscall
