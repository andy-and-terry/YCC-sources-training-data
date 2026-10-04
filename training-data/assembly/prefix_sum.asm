; x86-64 NASM: in-place prefix sums of an array
section .data
    array dq 3, 1, 4, 1, 5
    count equ 5

section .text
    global _start

_start:
    lea rsi, [array]
    mov rcx, 1
.loop:
    cmp rcx, count
    jge .done
    mov rax, [rsi + rcx*8 - 8]
    add [rsi + rcx*8], rax
    inc rcx
    jmp .loop
.done:
    ; array is now 3, 4, 8, 9, 14
    mov rdi, [array + (count-1)*8]
    mov rax, 60
    syscall
