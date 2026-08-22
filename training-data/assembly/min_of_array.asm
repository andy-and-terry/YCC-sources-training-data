; x86-64 NASM: find the minimum value in an array
section .data
    array dq 5, 3, 8, 1, 9, 2
    count equ 6

section .text
    global _start

_start:
    mov rax, [array]
    xor rcx, rcx
min_loop:
    cmp rcx, count
    jge min_done
    mov rdx, [array + rcx * 8]
    cmp rdx, rax
    jge min_skip
    mov rax, rdx
min_skip:
    inc rcx
    jmp min_loop
min_done:
    mov rdi, rax
    mov rax, 60
    syscall
