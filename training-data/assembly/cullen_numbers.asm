; x86-64 NASM: Cullen number C(4) = 4 * 2^4 + 1 = 65, returned as exit status
section .text
    global _start

_start:
    mov rcx, 4          ; n
    mov rax, 1
    shl rax, cl         ; 2^n
    imul rax, rcx       ; n * 2^n
    inc rax             ; + 1
    mov rdi, rax
    mov rax, 60
    syscall
