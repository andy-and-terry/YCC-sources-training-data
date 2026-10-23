; x86-64 NASM: hardware CRC-32C (Castagnoli) with the SSE4.2 crc32 instruction
; exit status: low byte of the CRC of "123456789" (check value 0xE3069283 -> 131)
section .data
    msg     db "123456789"
    msg_len equ $ - msg

section .text
    global _start

_start:
    mov eax, 0xFFFFFFFF       ; initial value
    lea rsi, [msg]
    mov ecx, msg_len
.next:
    crc32 eax, byte [rsi]
    inc rsi
    dec ecx
    jnz .next
    not eax                   ; final xor
    movzx edi, al
    mov rax, 60
    syscall
