section .data
arr dd 1, 2, 3, 4, 5
n   equ 5

section .text
global _start
_start:
    xor eax, eax
    xor ecx, ecx
.loop:
    add eax, [arr + ecx*4]
    inc ecx
    cmp ecx, n
    jl .loop
    mov ebx, eax
    mov eax, 1
    int 0x80
