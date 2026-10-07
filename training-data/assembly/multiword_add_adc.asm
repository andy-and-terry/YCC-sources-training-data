; x86-64 NASM: add two 128-bit integers using add/adc with carry propagation
; a = 0x0000000000000001_FFFFFFFFFFFFFFFF
; b = 0x0000000000000000_0000000000000001
; a + b = 0x0000000000000002_0000000000000000
section .data
    a_lo dq 0xFFFFFFFFFFFFFFFF
    a_hi dq 0x1
    b_lo dq 0x1
    b_hi dq 0x0

section .bss
    r_lo resq 1
    r_hi resq 1

section .text
    global _start

_start:
    mov rax, [a_lo]
    mov rdx, [a_hi]
    add rax, [b_lo]            ; low halves; sets carry
    adc rdx, [b_hi]            ; high halves plus carry
    mov [r_lo], rax
    mov [r_hi], rdx

    ; exit with the high word (2); low word is 0
    mov rdi, [r_hi]
    add rdi, [r_lo]
    mov rax, 60
    syscall
