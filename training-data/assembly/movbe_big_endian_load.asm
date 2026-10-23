; x86-64 NASM: movbe loads/stores with a byte swap (big-endian data)
; exit status: 120
section .data
    wire    db 0x12, 0x34, 0x56, 0x78   ; big-endian 32-bit value 0x12345678

section .bss
    outbuf  resb 4

section .text
    global _start

_start:
    movbe eax, [wire]         ; eax = 0x12345678
    movbe [outbuf], eax          ; stores bytes back in big-endian order
    mov ecx, [outbuf]            ; plain load sees the original little-endian bytes
    cmp eax, 0x12345678
    jne fail
    movzx edi, al             ; low byte 0x78 = 120
    mov rax, 60
    syscall
fail:
    mov edi, 1
    mov rax, 60
    syscall
