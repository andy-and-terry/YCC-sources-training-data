; x86-64 NASM: count how many times a target character appears in a
; null-terminated string
section .data
    text db "mississippi", 0
    target equ 's'

section .text
    global _start

_start:
    lea rsi, [text]
    xor rbx, rbx
scan_loop:
    mov al, [rsi]
    cmp al, 0
    je done
    cmp al, target
    jne next_char
    inc rbx
next_char:
    inc rsi
    jmp scan_loop
done:
    mov rdi, rbx               ; count = 4
    mov rax, 60
    syscall
