; x86-64 NASM: shld shifts a register pair as one 128-bit value
; exit status: 31
section .text
    global _start

_start:
    mov rax, 0xF000000000000001   ; low 64 bits
    mov rdx, 0x1                  ; high 64 bits
    ; shift rdx:rax left by 4: bits shifted out of rax enter rdx
    shld rdx, rax, 4              ; rdx = (1 << 4) | 0xF = 0x1F
    shl rax, 4                    ; shld does not modify the source operand
    mov rdi, rdx
    mov rax, 60
    syscall
