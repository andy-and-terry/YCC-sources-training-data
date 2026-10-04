; x86-64 NASM: reverse the bits of a byte (0b00010110 -> 0b01101000)
section .text
    global _start

_start:
    mov al, 0b00010110
    xor bl, bl                 ; bl accumulates the reversed byte
    mov ecx, 8
reverse_loop:
    shl bl, 1                  ; make room for the next bit
    shr al, 1                  ; shift lowest bit of al into carry
    adc bl, 0                  ; add carry into bl
    dec ecx
    jnz reverse_loop

    ; bl = 0b01101000 = 104
    movzx rdi, bl
    mov rax, 60
    syscall
