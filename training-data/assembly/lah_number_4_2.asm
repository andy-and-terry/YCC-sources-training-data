; x86-64 NASM: Lah number L(4,2) = C(3,1) * 4!/2! = 3 * 12 = 36
section .text
    global _start

_start:
    mov eax, 3              ; C(3,1)
    mov ecx, 3              ; multiply by 3 * 4  (= 4!/2!)
    mov edx, 4
    imul eax, ecx
    imul eax, edx
    mov edi, eax
    mov eax, 60
    syscall
