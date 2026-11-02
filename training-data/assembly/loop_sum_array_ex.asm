section .data
arr dd 1, 2, 3, 4, 5
section .text
global _start
_start:
    xor eax, eax
    lea rsi, [rel arr]
    mov ecx, 5
.next:
    add eax, [rsi]
    add rsi, 4
    loop .next
    mov edi, eax
    mov eax, 60
    syscall
