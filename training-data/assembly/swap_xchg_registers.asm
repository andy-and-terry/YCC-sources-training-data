section .text
global _start
_start:
    mov eax, 3
    mov ebx, 9
    xchg eax, ebx
    mov eax, 1
    int 0x80
