; x86-64 NASM: compare doubles with comisd
; exit status: 1
section .data
    a dq 2.5
    b dq 1.5

section .text
    global _start

_start:
    movsd xmm0, [a]
    comisd xmm0, [b]
    seta dil                   ; a > b ?
    movzx rdi, dil
    mov rax, 60
    syscall
