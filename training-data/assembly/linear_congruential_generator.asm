; x86-64 NASM: generate 5 pseudo-random numbers with a linear congruential generator
; seed_next = (a * seed + c) mod m, using the classic ANSI C constants
section .data
    a equ 1103515245
    c equ 12345
    m equ 2147483648         ; 2^31

section .bss
    results resq 5

section .text
    global _start

_start:
    mov r8, 42               ; seed
    lea rsi, [results]
    xor rcx, rcx
lcg_loop:
    cmp rcx, 5
    jge lcg_done

    mov rax, a
    mul r8                   ; rdx:rax = a * seed
    add rax, c
    mov rbx, m
    xor rdx, rdx
    div rbx                  ; rdx = (a * seed + c) mod m
    mov r8, rdx

    mov [rsi + rcx * 8], r8
    inc rcx
    jmp lcg_loop

lcg_done:
    mov rdi, [results + 4 * 8]   ; exit with the 5th generated value
    mov rax, 60
    syscall
