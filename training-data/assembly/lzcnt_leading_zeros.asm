; x86-64 NASM: count leading zeros of a 32-bit value with BSR
; exit status: 28
section .text
    global _start

_start:
    mov eax, 8                 ; 0b1000, highest set bit is bit 3
    bsr ecx, eax               ; ecx = 3
    mov edi, 31
    sub edi, ecx               ; leading zeros = 31 - 3
    mov rax, 60
    syscall
