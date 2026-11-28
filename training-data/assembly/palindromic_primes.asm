; x86-64 NASM: is 131 a palindrome? reverse digits and compare
; exit status: 1 if palindrome (expected: 1)
section .text
    global _start

_start:
    mov r8, 131
    mov rax, r8
    xor rcx, rcx
    mov rbx, 10
.loop:
    xor rdx, rdx
    div rbx
    imul rcx, rbx
    add rcx, rdx
    test rax, rax
    jnz .loop
    xor rdi, rdi
    cmp rcx, r8
    sete dil
    mov rax, 60
    syscall
