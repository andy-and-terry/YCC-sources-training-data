; x86-64 NASM: add two doubles with SSE2 and compare to 4.0 (1.5 + 2.5)
; exit status: 1
section .data
    a dq 1.5
    b dq 2.5
    c dq 4.0
section .text
    global _start

_start:
    movsd xmm0, [a]
    addsd xmm0, [b]
    ucomisd xmm0, [c]
    xor rdi, rdi
    sete dil
    mov rax, 60
    syscall
