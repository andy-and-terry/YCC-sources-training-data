; x86-64 NASM: scalar double-precision dot product with SSE2
section .data
    xs dq 1.0, 2.0, 3.0
    ys dq 4.0, 5.0, 6.0

section .text
    global _start

_start:
    lea rsi, [rel xs]
    lea rdi, [rel ys]
    xorpd xmm0, xmm0
    xor ecx, ecx
dot:
    movsd xmm1, [rsi + rcx*8]
    mulsd xmm1, [rdi + rcx*8]
    addsd xmm0, xmm1
    inc ecx
    cmp ecx, 3
    jb  dot
    cvttsd2si edi, xmm0        ; 4 + 10 + 18 = 32
    mov eax, 60
    syscall
