; x86-64 NASM: maximum pieces from 7 straight cuts of a pancake: n(n+1)/2 + 1 = 29
section .text
    global _start

_start:
    mov eax, 7
    lea edx, [eax + 1]
    imul eax, edx
    shr eax, 1
    inc eax
    mov edi, eax
    mov eax, 60
    syscall
