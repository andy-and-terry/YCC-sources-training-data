; x86-64 NASM: jump search over a sorted array (fixed block size)
section .data
    array dq 1, 3, 5, 7, 9, 11, 13, 15, 17, 19
    count equ 10
    step equ 3
    target equ 13

section .text
    global _start

_start:
    xor r8, r8              ; prev = start of current block
    mov r9, step             ; boundary = end of current block

jump_loop:
    mov r10, r9
    cmp r10, count
    jl idx_ok
    mov r10, count
idx_ok:
    dec r10                  ; r10 = min(boundary, count) - 1
    mov rax, [array + r10 * 8]
    cmp rax, target
    jge jump_done
    mov r8, r9
    add r9, step
    cmp r8, count
    jl jump_loop
jump_done:
    mov r11, r9
    cmp r11, count
    jle bound_ok
    mov r11, count
bound_ok:
    mov rcx, r8
linear_loop:
    cmp rcx, r11
    jge not_found
    mov rax, [array + rcx * 8]
    cmp rax, target
    je found
    inc rcx
    jmp linear_loop
found:
    mov rdi, rcx              ; expected: index 6
    jmp finish
not_found:
    mov rdi, -1
finish:
    mov rax, 60
    syscall
