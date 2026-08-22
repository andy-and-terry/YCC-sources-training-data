; x86-64 NASM: bubble sort an array in place
section .data
    array dq 5, 2, 9, 1, 5, 6
    count equ 6

section .text
    global _start

_start:
    mov r8, count          ; outer loop counter
outer_loop:
    dec r8
    jz sort_done
    xor rcx, rcx           ; inner index
inner_loop:
    cmp rcx, r8
    jge outer_loop
    mov rax, [array + rcx * 8]
    mov rdx, [array + rcx * 8 + 8]
    cmp rax, rdx
    jle no_swap
    mov [array + rcx * 8], rdx
    mov [array + rcx * 8 + 8], rax
no_swap:
    inc rcx
    jmp inner_loop
sort_done:
    mov rax, [array]
    mov rdi, rax
    mov rax, 60
    syscall
