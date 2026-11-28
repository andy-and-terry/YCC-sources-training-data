; x86-64 NASM: y = 3 gives the cuban prime 3y^2 + 3y + 1 = 37
section .text
    global _start

_start:
    mov eax, 3
    mov ecx, eax
    imul eax, ecx           ; y^2
    lea eax, [eax + eax * 2] ; 3y^2
    lea edx, [ecx + ecx * 2] ; 3y
    add eax, edx
    inc eax
    mov edi, eax            ; exit code 37
    mov eax, 60
    syscall
