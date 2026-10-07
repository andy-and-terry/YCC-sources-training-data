; x86-64 NASM: Caesar cipher encode an uppercase string by a fixed shift
section .data
    plaintext db "HELLO"
    len equ 5
    shift equ 3

section .bss
    encoded resb len

section .text
    global _start

_start:
    xor rcx, rcx
encode_loop:
    cmp rcx, len
    jge encode_done
    movzx rax, byte [plaintext + rcx]
    sub rax, 'A'
    add rax, shift
    cmp rax, 26
    jl store_char
    sub rax, 26
store_char:
    add rax, 'A'
    mov [encoded + rcx], al
    inc rcx
    jmp encode_loop
encode_done:
    ; "HELLO" shifted by 3 becomes "KHOOR"; exit with the first byte ('K' = 75)
    movzx rax, byte [encoded]
    mov rdi, rax
    mov rax, 60
    syscall
