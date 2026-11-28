; x86-64 NASM: affine map y = (5*x + 8) mod 26 for letter 'F' (x=5)
; exit status: 7 (index of 'H')
section .text
    global _start

_start:
    mov rax, 5
    imul rax, 5
    add rax, 8
    xor rdx, rdx
    mov rcx, 26
    div rcx
    mov rdi, rdx
    mov rax, 60
    syscall
