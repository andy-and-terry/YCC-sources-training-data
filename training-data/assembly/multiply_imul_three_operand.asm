; x86-64 NASM: imul with immediate operand
; exit status: 63
section .text
    global _start

_start:
    mov rbx, 9
    imul rdi, rbx, 7           ; rdi = 9 * 7
    mov rax, 60
    syscall
