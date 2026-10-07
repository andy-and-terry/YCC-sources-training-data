; x86-64 NASM: binary to Gray code (n ^ (n >> 1)) and back
section .text
    global _start

_start:
    mov eax, 13          ; 0b1101
    mov ebx, eax
    shr ebx, 1
    xor ebx, eax         ; gray = 0b1011 = 11
    mov eax, ebx         ; decode: b = g ^ g>>1 ^ g>>2 ...
    mov ecx, ebx
decode:
    shr ecx, 1
    jz decoded
    xor eax, ecx
    jmp decode
decoded:
    mov edi, eax         ; 13 again
    mov eax, 60
    syscall
