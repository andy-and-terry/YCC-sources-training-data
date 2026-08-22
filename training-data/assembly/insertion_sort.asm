; x86-64 NASM: insertion sort
section .data
    array dq 12, 11, 13, 5, 6
    count equ 5

section .text
    global _start

_start:
    mov rcx, 1
outer_loop:
    cmp rcx, count
    jge sort_done
    mov rax, [array + rcx * 8]   ; key
    mov rdx, rcx
    dec rdx                       ; j = i - 1
inner_loop:
    cmp rdx, 0
    jl insert_key
    mov rbx, [array + rdx * 8]
    cmp rbx, rax
    jle insert_key
    mov [array + rdx * 8 + 8], rbx
    dec rdx
    jmp inner_loop
insert_key:
    mov [array + rdx * 8 + 8], rax
    inc rcx
    jmp outer_loop
sort_done:
    mov rax, [array]
    mov rdi, rax
    mov rax, 60
    syscall
