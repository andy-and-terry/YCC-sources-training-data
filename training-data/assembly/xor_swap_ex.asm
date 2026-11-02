section .text
global _start
_start:
    mov eax, 3
    mov ebx, 8
    xor eax, ebx
    xor ebx, eax
    xor eax, ebx       ; swapped
    mov edi, eax
    mov eax, 60
    syscall
