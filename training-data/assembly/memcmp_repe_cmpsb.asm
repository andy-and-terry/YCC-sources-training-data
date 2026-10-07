; x86-64 NASM: compare two buffers with repe cmpsb (exit 0 if equal)
section .data
    a db "hello", 0
    b db "hellp", 0

section .text
    global _start

_start:
    lea rsi, [rel a]
    lea rdi, [rel b]
    mov ecx, 5
    cld
    repe cmpsb
    mov edi, 0
    je equal
    mov edi, 1           ; differ -> status 1
equal:
    mov eax, 60
    syscall
