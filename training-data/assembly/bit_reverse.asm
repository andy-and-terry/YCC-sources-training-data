; x86-64 NASM: reverse the bits of an 8-bit value (0b00010110 -> 0b01101000)
section .text
    global _start

_start:
    mov al, 0b00010110
    mov ecx, 8
    xor edx, edx
rev_loop:
    shl dl, 1
    shr al, 1
    adc dl, 0            ; carry holds the bit shifted out of al
    dec ecx
    jnz rev_loop
    movzx edi, dl        ; exit status = 0b01101000 = 104
    mov eax, 60
    syscall
