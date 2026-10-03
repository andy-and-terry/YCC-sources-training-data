; x86-64 NASM: reverse the byte order of a 32-bit value with BSWAP
section .text
    global _start

_start:
    mov eax, 0x12345678
    bswap eax             ; eax becomes 0x78563412
    mov rdi, rax
    and rdi, 0xFF          ; exit with the new low byte (0x78 = 120)
    mov rax, 60
    syscall
