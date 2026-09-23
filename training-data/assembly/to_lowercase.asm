; x86-64 NASM: convert an uppercase ASCII string to lowercase
section .data
    text db "HELLO"
    len equ 5

section .bss
    lowered resb len

section .text
    global _start

_start:
    xor rcx, rcx
lower_loop:
    cmp rcx, len
    jge lower_done
    mov al, [text + rcx]
    cmp al, 'A'
    jl store_char
    cmp al, 'Z'
    jg store_char
    add al, 32
store_char:
    mov [lowered + rcx], al
    inc rcx
    jmp lower_loop
lower_done:
    ; expect "hello"; exit with the first byte ('h' = 104)
    movzx rax, byte [lowered]
    mov rdi, rax
    mov rax, 60
    syscall
