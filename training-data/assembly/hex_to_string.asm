; x86-64 NASM: convert an integer to its hexadecimal string representation
section .data
    value dq 0xDEADBEEF
    hex_digits db "0123456789abcdef"

section .bss
    buffer resb 17

section .text
    global _start

_start:
    mov rax, [value]
    lea rdi, [buffer + 16]
    mov byte [rdi], 0          ; null terminator
    mov rcx, 16                 ; always emit 16 hex digits
convert_loop:
    dec rdi
    mov rbx, rax
    and rbx, 0xF
    lea rsi, [hex_digits]
    mov bl, [rsi + rbx]
    mov [rdi], bl
    shr rax, 4
    dec rcx
    jnz convert_loop

    ; rdi now points at the start of the hex string; exit with its length
    lea rax, [buffer]
    add rax, 16
    lea rsi, [buffer]
    sub rax, rsi
    mov rdi, rax
    mov rax, 60
    syscall
