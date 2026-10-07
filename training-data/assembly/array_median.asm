; x86-64 NASM: sort a small array in place (insertion sort) then read
; off the middle element as the median
section .data
    array dq 9, 3, 7, 1, 5
    count equ 5

section .text
    global _start

_start:
    mov rcx, 1
outer_loop:
    cmp rcx, count
    jge sorted
    mov rax, [array + rcx * 8]   ; key
    mov rdx, rcx
inner_loop:
    cmp rdx, 0
    je insert
    mov rbx, [array + rdx * 8 - 8]
    cmp rbx, rax
    jle insert
    mov [array + rdx * 8], rbx
    dec rdx
    jmp inner_loop
insert:
    mov [array + rdx * 8], rax
    inc rcx
    jmp outer_loop
sorted:
    mov rax, [array + (count / 2) * 8]   ; median = 5
    mov rdi, rax
    mov rax, 60
    syscall
