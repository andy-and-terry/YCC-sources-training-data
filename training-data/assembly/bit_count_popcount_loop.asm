section .text
global _start
_start:
    mov eax, 0b10110111
    xor ebx, ebx
.next:
    test eax, eax
    jz .done
    mov ecx, eax
    and ecx, 1
    add ebx, ecx
    shr eax, 1
    jmp .next
.done:
    mov eax, 1
    int 0x80
