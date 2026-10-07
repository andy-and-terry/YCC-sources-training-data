; x86-64 NASM: swap the high and low nibbles of a byte (0xA5 -> 0x5A)
section .text
    global _start

_start:
    mov al, 0xA5
    rol al, 4                  ; rotating by 4 swaps the nibbles
    ; al = 0x5A = 90

    ; same result using masks and shifts
    mov bl, 0xA5
    mov cl, bl
    shr cl, 4                  ; high nibble to low position
    shl bl, 4                  ; low nibble to high position
    or bl, cl

    cmp al, bl
    jne mismatch
    movzx rdi, al              ; exit with 0x5A
    jmp done
mismatch:
    mov rdi, 255
done:
    mov rax, 60
    syscall
