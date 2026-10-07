; x86-64 NASM: fill a buffer with a byte via rep stosb, then sum it
section .bss
    buf resb 8

section .text
    global _start

_start:
    lea rdi, [rel buf]
    mov al, 5
    mov ecx, 8
    cld
    rep stosb
    xor eax, eax
    lea rsi, [rel buf]
    mov ecx, 8
sum_loop:
    movzx edx, byte [rsi]
    add eax, edx
    inc rsi
    loop sum_loop
    mov edi, eax         ; 8 * 5 = 40
    mov eax, 60
    syscall
