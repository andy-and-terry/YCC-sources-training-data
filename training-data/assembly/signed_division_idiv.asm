; x86-64 NASM: signed division and remainder with idiv
; exit status: 5   (quotient of -17/-3 is 5, remainder -2)
section .text
    global _start

_start:
    mov rax, -17
    cqo                        ; sign-extend rax into rdx:rax
    mov rbx, -3
    idiv rbx                   ; rax = 5, rdx = -2
    mov rdi, rax
    mov rax, 60
    syscall
