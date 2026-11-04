; x86-64 NASM: byte-swap a 32-bit value
global _start
section .text
_start:
    mov eax, 0x11223344
    bswap eax          ; eax = 0x44332211
    mov edi, eax
    shr edi, 24        ; exit status = 0x44
    mov eax, 60
    syscall
