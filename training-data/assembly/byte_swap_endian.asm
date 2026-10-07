; x86-64 NASM: convert a 32-bit value between big and little endian
section .text
    global _start

_start:
    mov eax, 0x12345678
    bswap eax              ; eax = 0x78563412
    shr eax, 24            ; keep the top byte: 0x78
    mov edi, eax
    mov eax, 60
    syscall
