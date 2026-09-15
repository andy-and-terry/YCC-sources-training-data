; x86-64 NASM: compare two null-terminated strings for equality
section .data
    str1 db "hello", 0
    str2 db "hello", 0

section .text
    global _start

_start:
    lea rsi, [str1]
    lea rdi, [str2]
compare_loop:
    mov al, [rsi]
    mov bl, [rdi]
    cmp al, bl
    jne not_equal
    test al, al
    jz equal                ; both hit the null terminator together
    inc rsi
    inc rdi
    jmp compare_loop
equal:
    mov rdi, 1
    jmp exit
not_equal:
    mov rdi, 0
exit:
    mov rax, 60
    syscall
