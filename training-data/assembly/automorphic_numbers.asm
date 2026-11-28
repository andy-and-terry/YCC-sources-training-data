; x86-64 NASM: is 76 automorphic? 76*76 = 5776 ends in 76
; exit status: 1 if yes (expected: 1)
section .text
    global _start

_start:
    mov r8, 76
    mov rax, r8
    imul rax, r8                ; square
    mov rbx, 100                ; 10^(digits of 76)
    xor rdx, rdx
    div rbx                     ; rdx = square mod 100
    xor rdi, rdi
    cmp rdx, r8
    sete dil
    mov rax, 60
    syscall
