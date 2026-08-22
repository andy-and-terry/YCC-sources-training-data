; x86-64 NASM: sum array elements using a function call
section .data
    array dq 1, 2, 3, 4, 5
    count equ 5

section .text
    global _start

sum_array:
    ; rdi = pointer, rsi = count -> returns sum in rax
    xor rax, rax
    xor rcx, rcx
sum_loop:
    cmp rcx, rsi
    jge sum_ret
    add rax, [rdi + rcx * 8]
    inc rcx
    jmp sum_loop
sum_ret:
    ret

_start:
    lea rdi, [array]
    mov rsi, count
    call sum_array
    mov rdi, rax
    mov rax, 60
    syscall
