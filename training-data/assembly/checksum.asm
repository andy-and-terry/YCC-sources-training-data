; x86-64 NASM: compute a simple XOR checksum over a byte array
section .data
    data db 0x3A, 0x7B, 0x10, 0xFF, 0x22
    len equ 5

section .text
    global _start

_start:
    lea rsi, [data]
    xor rax, rax           ; checksum = 0
    xor rcx, rcx
checksum_loop:
    cmp rcx, len
    jge checksum_done
    xor al, byte [rsi + rcx]
    inc rcx
    jmp checksum_loop
checksum_done:
    mov rdi, rax
    mov rax, 60
    syscall
