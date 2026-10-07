; x86-64 NASM: round up to the next power of two (37 -> 64)
section .text
    global _start

_start:
    mov eax, 37
    dec eax
    mov edx, eax
    shr edx, 1
    or eax, edx
    mov edx, eax
    shr edx, 2
    or eax, edx
    mov edx, eax
    shr edx, 4
    or eax, edx
    mov edx, eax
    shr edx, 8
    or eax, edx
    mov edx, eax
    shr edx, 16
    or eax, edx
    inc eax              ; 64
    mov edi, eax
    mov eax, 60
    syscall
