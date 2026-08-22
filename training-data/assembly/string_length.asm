; x86-64 NASM: compute the length of a null-terminated string
section .data
    msg db "hello world", 0

section .text
    global _start

_start:
    lea rsi, [msg]
    xor rax, rax           ; length counter
count_loop:
    cmp byte [rsi + rax], 0
    je count_done
    inc rax
    jmp count_loop
count_done:
    ; rax now holds the string length (11); exit with it as status
    mov rdi, rax
    mov rax, 60
    syscall
