; x86-64 NASM: sum the integers in an array
section .data
    array dq 5, 3, 8, 1, 9, 2
    count equ 6

section .text
    global _start

_start:
    xor rax, rax          ; sum = 0
    xor rcx, rcx          ; index = 0
sum_loop:
    cmp rcx, count
    jge sum_done
    mov rdx, [array + rcx * 8]
    add rax, rdx
    inc rcx
    jmp sum_loop
sum_done:
    ; rax now holds the sum; exit with sum as status code (mod 256)
    mov rdi, rax
    mov rax, 60
    syscall
