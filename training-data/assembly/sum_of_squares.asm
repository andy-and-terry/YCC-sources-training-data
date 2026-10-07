; x86-64 NASM: sum of squares 1..5 using imul (1+4+9+16+25 = 55)
section .text
    global _start

_start:
    xor ebx, ebx
    mov ecx, 1
sq_loop:
    mov eax, ecx
    imul eax, ecx
    add ebx, eax
    inc ecx
    cmp ecx, 5
    jle sq_loop
    mov edi, ebx
    mov eax, 60
    syscall
