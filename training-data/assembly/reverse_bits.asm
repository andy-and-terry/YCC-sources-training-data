; x86-64 NASM: reverse the low 8 bits of a byte (0b00010110 -> 0b01101000 = 104)
section .text
    global _start

_start:
    mov al, 0b00010110
    xor bl, bl
    mov ecx, 8
rev_loop:
    shl bl, 1
    shr al, 1
    adc bl, 0          ; carry from shr is the bit that fell off
    dec ecx
    jnz rev_loop
    movzx edi, bl
    mov rax, 60
    syscall
