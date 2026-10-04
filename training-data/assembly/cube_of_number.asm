; x86-64 NASM: compute n*n*n with imul
section .text
    global _start

cube:
    ; rdi = n -> rax = n^3
    mov rax, rdi
    imul rax, rdi
    imul rax, rdi
    ret

_start:
    mov rdi, 4
    call cube              ; 64
    mov rdi, rax
    mov rax, 60
    syscall
