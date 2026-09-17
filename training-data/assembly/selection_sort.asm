; x86-64 NASM: selection sort an array in place
section .data
    array dq 29, 10, 14, 37, 13
    count equ 5

section .text
    global _start

_start:
    xor r8, r8              ; i = 0
outer_loop:
    cmp r8, count - 1
    jge sort_done
    mov r9, r8               ; min_index = i
    mov rax, r8
    add rax, 1
    mov r10, rax              ; j = i + 1
inner_loop:
    cmp r10, count
    jge do_swap
    mov rax, [array + r9 * 8]
    mov rbx, [array + r10 * 8]
    cmp rbx, rax
    jge skip_update
    mov r9, r10               ; new min_index found
skip_update:
    inc r10
    jmp inner_loop
do_swap:
    cmp r9, r8
    je no_swap
    mov rax, [array + r8 * 8]
    mov rbx, [array + r9 * 8]
    mov [array + r8 * 8], rbx
    mov [array + r9 * 8], rax
no_swap:
    inc r8
    jmp outer_loop
sort_done:
    mov rax, [array]
    mov rdi, rax
    mov rax, 60
    syscall
