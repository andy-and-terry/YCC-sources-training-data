section .data
msg db "hello", 0

section .text
global _start
_start:
    mov edi, msg
    xor al, al
    mov ecx, -1
    repne scasb
    not ecx
    dec ecx
    mov ebx, ecx
    mov eax, 1
    int 0x80
