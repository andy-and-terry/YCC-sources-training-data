section .text
global _start
_start:
    mov eax, 17
    mov ebx, 42
    cmp eax, ebx
    cmovl eax, ebx      ; eax = max
    mov edi, eax
    mov eax, 60
    syscall
