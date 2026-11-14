section .text
global _start
_start:
    mov eax, 17
    mov ebx, 42
    cmp eax, ebx
    cmovl eax, ebx
    mov ebx, eax
    mov eax, 1
    int 0x80
