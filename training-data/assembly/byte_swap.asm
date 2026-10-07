; x86-64 NASM: convert 32-bit endianness with bswap
section .text
    global _start

_start:
    mov eax, 0x11223344
    bswap eax            ; eax = 0x44332211
    shr eax, 24          ; top byte = 0x44 = 68
    mov edi, eax
    mov eax, 60
    syscall
