; x86-64 NASM: reverse the decimal digits of 13 -> 31 (emirp pair check helper)
; exit status: 31
section .text
    global _start

_start:
    mov rax, 13
    xor rcx, rcx                ; reversed
    mov rbx, 10
.loop:
    xor rdx, rdx
    div rbx                     ; rdx = last digit
    imul rcx, rbx
    add rcx, rdx
    test rax, rax
    jnz .loop
    mov rdi, rcx
    mov rax, 60
    syscall
