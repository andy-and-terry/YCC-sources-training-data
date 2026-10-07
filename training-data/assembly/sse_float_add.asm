; x86-64 NASM: add two double-precision floats using the SSE2 scalar
; instructions instead of the general-purpose integer ALU
section .data
    a dq 3.5
    b dq 2.25

section .text
    global _start

_start:
    movsd xmm0, [a]
    movsd xmm1, [b]
    addsd xmm0, xmm1         ; xmm0 = 3.5 + 2.25 = 5.75
    cvttsd2si rax, xmm0      ; truncate to integer for the exit code: 5
    mov rdi, rax
    mov rax, 60
    syscall
