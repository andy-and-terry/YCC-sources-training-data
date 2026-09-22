; x86-64 NASM: rotate an array left by k positions into a second buffer
section .data
    array dq 1, 2, 3, 4, 5, 6, 7
    count equ 7
    k equ 3

section .bss
    rotated resq count

section .text
    global _start

_start:
    lea rdi, [array]
    lea rsi, [rotated]
    xor rcx, rcx
rotate_loop:
    cmp rcx, count
    jge rotate_done
    mov rax, rcx
    add rax, count
    sub rax, k
    xor rdx, rdx
    mov r8, count
    div r8                     ; rdx = (rcx + count - k) mod count
    mov rbx, [rdi + rcx * 8]
    mov [rsi + rdx * 8], rbx
    inc rcx
    jmp rotate_loop
rotate_done:
    mov rax, [rotated]
    mov rdi, rax                ; expected: array[0] after left-rotate = 4
    mov rax, 60
    syscall
