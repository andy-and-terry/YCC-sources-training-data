; x86-64 NASM: interleave bits of two 8-bit values into a 16-bit Morton code
section .text
    global _start

_start:
    mov bl, 0b1010       ; x
    mov cl, 0b0110       ; y
    xor eax, eax         ; result
    xor esi, esi         ; bit index
loop_bits:
    cmp esi, 8
    jae done
    movzx edx, bl
    bt edx, esi
    jnc skip_x
    lea edi, [esi*2]
    bts eax, edi
skip_x:
    movzx edx, cl
    bt edx, esi
    jnc skip_y
    lea edi, [esi*2 + 1]
    bts eax, edi
skip_y:
    inc esi
    jmp loop_bits
done:
    mov edi, eax         ; expected 0b01_10_01_10 = 0x66
    mov eax, 60
    syscall
