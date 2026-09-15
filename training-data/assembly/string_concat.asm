; x86-64 NASM: concatenate two null-terminated strings into a buffer
section .data
    str1 db "Hello, ", 0
    str2 db "World!", 0

section .bss
    buffer resb 32

section .text
    global _start

_start:
    lea rsi, [str1]
    lea rdi, [buffer]
copy_first:
    mov al, [rsi]
    test al, al
    jz copy_second_start
    mov [rdi], al
    inc rsi
    inc rdi
    jmp copy_first
copy_second_start:
    lea rsi, [str2]
copy_second:
    mov al, [rsi]
    mov [rdi], al
    test al, al
    jz concat_done
    inc rsi
    inc rdi
    jmp copy_second
concat_done:
    ; rdi points at the terminating null; compute the resulting length
    lea rax, [buffer]
    sub rdi, rax               ; rdi = length of "Hello, World!" (13)
    mov rax, 60
    syscall
