; x86-64 NASM: shell sort using the classic halving gap sequence
section .data
    array dq 12, 34, 54, 2, 3
    count equ 5

section .text
    global _start

_start:
    mov r8, count
    sar r8, 1                   ; gap = count / 2

gap_loop:
    cmp r8, 0
    je shell_done

    mov rcx, r8                  ; i = gap
outer_loop:
    cmp rcx, count
    jge next_gap
    mov rax, [array + rcx * 8]    ; temp = array[i]
    mov rdx, rcx                   ; j = i
inner_loop:
    cmp rdx, r8
    jl insert_temp
    mov r9, rdx
    sub r9, r8                      ; r9 = j - gap
    mov rbx, [array + r9 * 8]
    cmp rbx, rax
    jle insert_temp
    mov [array + rdx * 8], rbx
    mov rdx, r9
    jmp inner_loop
insert_temp:
    mov [array + rdx * 8], rax
    inc rcx
    jmp outer_loop
next_gap:
    sar r8, 1
    jmp gap_loop

shell_done:
    mov rax, [array]
    mov rdi, rax
    mov rax, 60
    syscall
