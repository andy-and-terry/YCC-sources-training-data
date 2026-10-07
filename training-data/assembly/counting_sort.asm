; x86-64 NASM: counting sort for small non-negative integers
section .data
    array dq 4, 2, 2, 8, 3, 3, 1
    len equ 7
    max_val equ 8

section .bss
    counts resq (max_val + 1)
    sorted resq len

section .text
    global _start

_start:
    lea rdi, [array]
    lea rsi, [counts]
    xor r8, r8
count_loop:
    cmp r8, len
    jge count_done
    mov rax, [rdi + r8 * 8]
    inc qword [rsi + rax * 8]
    inc r8
    jmp count_loop
count_done:
    lea r9, [sorted]
    xor r10, r10              ; output index
    xor r11, r11              ; current value
fill_outer:
    cmp r11, max_val
    jg fill_done
    mov rax, [rsi + r11 * 8]
    test rax, rax
    jz fill_next_value
fill_inner:
    mov [r9 + r10 * 8], r11
    inc r10
    dec rax
    jnz fill_inner
fill_next_value:
    inc r11
    jmp fill_outer
fill_done:
    mov rax, [sorted]
    mov rdi, rax
    mov rax, 60
    syscall
