; x86-64 NASM: reverse the 8 low bits of 13 (00001101 -> 10110000 = 176)
; exit status: 176
section .text
    global _start

_start:
    mov al, 13
    xor bl, bl
    mov ecx, 8
.loop:
    shr al, 1                   ; low bit -> carry
    rcl bl, 1                   ; carry -> bl low bit, shifting left
    loop .loop
    movzx rdi, bl
    mov rax, 60
    syscall
