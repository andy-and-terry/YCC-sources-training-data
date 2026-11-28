; x86-64 NASM: Gould's sequence g(n) = 2^popcount(n); g(11) = 8
section .text
    global _start

_start:
    mov eax, 11
    popcnt ecx, eax
    mov edi, 1
    shl edi, cl
    mov eax, 60
    syscall
