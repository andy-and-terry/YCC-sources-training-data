; x86-64 NASM: sum of squares of the digits of 123 (1+4+9)
; exit status: 14
section .text
    global _start

_start:
    mov rax, 123
    xor rsi, rsi
    mov rcx, 10
.next:
    xor rdx, rdx
    div rcx                    ; rax = quotient, rdx = digit
    imul rdx, rdx
    add rsi, rdx
    test rax, rax
    jnz .next
    mov rdi, rsi
    mov rax, 60
    syscall
