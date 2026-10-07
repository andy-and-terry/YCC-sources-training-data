; x86-64 NASM: reverse the bits of a byte
section .text
    global _start

_start:
    mov al, 0b00010110   ; input
    xor bl, bl           ; result
    mov ecx, 8
.loop:
    shl al, 1            ; MSB -> carry
    rcl bl, 1            ; shift carry into result
    loop .loop
    movzx rdi, bl        ; 0b01101000 = 104
    mov rax, 60
    syscall
