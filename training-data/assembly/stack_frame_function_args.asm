section .text
global _start

add3:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    add eax, [ebp+12]
    add eax, [ebp+16]
    pop ebp
    ret

_start:
    push 3
    push 2
    push 1
    call add3
    add esp, 12
    mov ebx, eax
    mov eax, 1
    int 0x80
