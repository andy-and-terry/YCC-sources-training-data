; x86-64 NASM: convert a lowercase string to uppercase in place
section .data
    msg db "hello world", 0

section .text
    global _start

_start:
    lea rsi, [msg]
upper_loop:
    mov al, [rsi]
    test al, al
    jz done
    cmp al, 'a'
    jl skip
    cmp al, 'z'
    jg skip
    sub al, 32                 ; 'a' - 'A' == 32
    mov [rsi], al
skip:
    inc rsi
    jmp upper_loop
done:
    ; exit with the ASCII code of the now-uppercase first character
    movzx rax, byte [msg]
    mov rdi, rax
    mov rax, 60
    syscall
