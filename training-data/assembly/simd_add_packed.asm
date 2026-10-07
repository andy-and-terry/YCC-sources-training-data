; x86-64 NASM: add four packed 32-bit integers at once with SSE2 paddd
section .data
    align 16
    va dd 1, 2, 3, 4
    vb dd 10, 20, 30, 40

section .text
    global _start

_start:
    movdqa xmm0, [rel va]
    paddd  xmm0, [rel vb]      ; 11, 22, 33, 44
    pextrw eax, xmm0, 6        ; low word of lane 3 = 44
    mov edi, eax
    mov eax, 60
    syscall
