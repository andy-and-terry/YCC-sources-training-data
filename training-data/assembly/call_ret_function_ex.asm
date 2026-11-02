section .text
global _start
square:
    mov eax, edi
    imul eax, eax
    ret
_start:
    mov edi, 9
    call square
    mov edi, eax
    mov eax, 60
    syscall
