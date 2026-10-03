; x86-64 NASM: population variance of a small integer array
section .data
    array dq 2, 4, 4, 4, 5, 5, 7, 9
    count equ 8

section .text
    global _start

_start:
    ; sum
    xor rax, rax
    xor rcx, rcx
sum_loop:
    cmp rcx, count
    jge mean_done
    add rax, [array + rcx * 8]
    inc rcx
    jmp sum_loop
mean_done:
    mov rbx, count
    xor rdx, rdx
    div rbx                  ; rax = mean (5)
    mov r8, rax               ; save mean

    ; sum of squared deviations
    xor r9, r9
    xor rcx, rcx
var_loop:
    cmp rcx, count
    jge var_done
    mov rax, [array + rcx * 8]
    sub rax, r8
    imul rax, rax
    add r9, rax
    inc rcx
    jmp var_loop
var_done:
    mov rax, r9
    mov rbx, count
    xor rdx, rdx
    div rbx                   ; rax = variance (4)
    mov rdi, rax
    mov rax, 60
    syscall
