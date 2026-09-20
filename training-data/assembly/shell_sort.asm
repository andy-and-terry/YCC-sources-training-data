; x86-64 NASM: shell sort using a halving gap sequence
section .data
    array dq 9, 5, 1, 4, 3, 7, 2, 6
    count equ 8

section .text
    global _start

_start:
    mov r8, count
    shr r8, 1                  ; gap = count / 2
gap_loop:
    cmp r8, 0
    je sort_done
    mov r9, r8                 ; i = gap
outer_loop:
    cmp r9, count
    jge next_gap
    mov r11, [array + r9 * 8]  ; temp = array[i]
    mov r10, r9                ; j = i
inner_loop:
    cmp r10, r8
    jl insert_temp
    mov rax, r10
    sub rax, r8                ; j - gap
    mov rbx, [array + rax * 8]
    cmp rbx, r11
    jle insert_temp
    mov [array + r10 * 8], rbx ; array[j] = array[j - gap]
    mov r10, rax                ; j = j - gap
    jmp inner_loop
insert_temp:
    mov [array + r10 * 8], r11
    inc r9
    jmp outer_loop
next_gap:
    shr r8, 1
    jmp gap_loop
sort_done:
    mov rax, [array]
    mov rdi, rax
    mov rax, 60
    syscall
