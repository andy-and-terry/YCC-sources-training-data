section .text
global _start

fact:
    cmp eax, 1
    jle .base
    push eax
    dec eax
    call fact
    pop ecx
    imul eax, ecx
    ret
.base:
    mov eax, 1
    ret

_start:
    mov eax, 5
    call fact
    mov ebx, eax
    mov eax, 1
    int 0x80
