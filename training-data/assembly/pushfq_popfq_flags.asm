; x86-64 NASM: read RFLAGS with pushfq and extract ZF (bit 6) and DF (bit 10)
; exit status: 3
section .text
    global _start

_start:
    xor eax, eax          ; sets ZF = 1
    std                   ; sets DF = 1 (does not touch ZF)
    pushfq
    cld                   ; restore the ABI-required DF = 0
    pop rax               ; rax holds the flags captured above
    mov rdi, rax
    shr rdi, 6
    and edi, 1            ; ZF -> bit 0 of result
    shr rax, 10
    and eax, 1            ; DF
    lea rdi, [rdi + rax*2]
    mov rax, 60
    syscall
