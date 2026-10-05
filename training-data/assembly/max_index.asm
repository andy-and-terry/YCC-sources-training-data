; x86-64 NASM: index of the maximum element in a dword array (expects 3)
section .data
    arr dd 4, 9, 2, 17, 8
    len equ 5

section .text
    global _start

_start:
    xor ebx, ebx        ; best index
    mov ecx, 1
scan:
    mov eax, [arr + rcx*4]
    cmp eax, [arr + rbx*4]
    jle skip
    mov ebx, ecx
skip:
    inc ecx
    cmp ecx, len
    jl scan
    mov edi, ebx
    mov rax, 60
    syscall
