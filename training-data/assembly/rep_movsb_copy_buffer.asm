; x86-64 NASM: copy 5 bytes with rep movsb, exit with last byte
; exit status: 5
section .data
src: db 1, 2, 3, 4, 5
section .bss
dst: resb 5
section .text
    global _start

_start:
    lea rsi, [rel src]
    lea rdi, [rel dst]
    mov rcx, 5
    cld
    rep movsb
    movzx edi, byte [rel dst + 4]
    mov rax, 60
    syscall
