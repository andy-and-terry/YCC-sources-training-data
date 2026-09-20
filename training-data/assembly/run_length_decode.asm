; x86-64 NASM: run-length decode (value, count) pairs into an expanded array
section .data
    encoded   dq 4, 3, 7, 2, 2, 4   ; pairs: (value, count)
    num_pairs equ 3

section .bss
    decoded resq 32

section .text
    global _start

_start:
    lea rsi, [encoded]
    lea rdi, [decoded]
    xor r8, r8                 ; pair index
    xor r9, r9                 ; output index
pair_loop:
    cmp r8, num_pairs
    jge pair_done
    mov rax, [rsi]              ; value
    mov rcx, [rsi + 8]          ; count
    add rsi, 16
fill_loop:
    cmp rcx, 0
    je fill_done
    mov [rdi + r9 * 8], rax
    inc r9
    dec rcx
    jmp fill_loop
fill_done:
    inc r8
    jmp pair_loop
pair_done:
    xor rax, rax                ; sum of decoded values, as a check
    xor r10, r10
sum_loop:
    cmp r10, r9
    jge sum_done
    add rax, [decoded + r10 * 8]
    inc r10
    jmp sum_loop
sum_done:
    mov rdi, rax
    mov rax, 60
    syscall
