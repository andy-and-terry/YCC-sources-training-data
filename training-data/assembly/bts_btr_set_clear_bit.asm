; x86-64 NASM: set and clear bits using bts / btr
; exit status: 17
section .text
    global _start

_start:
    xor rdi, rdi
    bts rdi, 0                 ; 1
    bts rdi, 4                 ; 17
    bts rdi, 6                 ; 81
    btr rdi, 6                 ; back to 17
    mov rax, 60
    syscall
