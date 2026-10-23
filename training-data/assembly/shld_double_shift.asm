; x86-64 NASM: shld/shrd shift a 128-bit value (rdx:rax) left by 4 bits
; rdx:rax = 0xF000000000000000 : 0x0000000000000001 -> shifted left 4
; exit status: 16 (low qword becomes 0x10)
section .text
    global _start

_start:
    mov rax, 1                 ; low half
    mov rdx, 0xF000000000000000 ; high half
    shld rdx, rax, 4           ; high = (high << 4) | top 4 bits of low
    shl rax, 4                 ; low half shifts on its own
    ; rdx is now 0 (the 0xF nibble was shifted out), rax = 0x10
    or rdx, rdx
    jnz .bad
    mov rdi, rax
    jmp .exit
.bad:
    mov rdi, 255
.exit:
    mov rax, 60
    syscall
