; x86-64 NASM: square root with sqrtsd and conversion to integer
; exit status: 12
section .data
    val dq 144.0

section .text
    global _start

_start:
    movsd xmm0, [val]
    sqrtsd xmm0, xmm0
    cvttsd2si rdi, xmm0
    mov rax, 60
    syscall
