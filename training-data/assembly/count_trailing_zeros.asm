; x86-64 NASM: count trailing zero bits with bsf (40 = 0b101000 -> 3)
section .text
    global _start

_start:
    mov eax, 40
    bsf ecx, eax         ; index of lowest set bit (undefined if eax == 0)
    mov edi, ecx
    mov eax, 60
    syscall
