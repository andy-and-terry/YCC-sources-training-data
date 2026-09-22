; x86-64 NASM: convert an integer to its decimal string representation (itoa)
section .bss
    buffer resb 16

section .text
    global _start

_start:
    mov rax, 8675          ; number to convert
    lea rdi, [buffer + 15]
    mov byte [rdi], 0
    mov rcx, 10
convert_loop:
    xor rdx, rdx
    div rcx
    add rdx, '0'
    dec rdi
    mov [rdi], dl
    cmp rax, 0
    jne convert_loop
    ; rdi now points to the first digit; buffer+15 held the null terminator
    lea rsi, [buffer + 15]
    sub rsi, rdi           ; rsi = string length
    mov rdi, rsi
    mov rax, 60
    syscall
