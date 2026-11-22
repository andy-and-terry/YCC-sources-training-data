; x86-64 NASM: lazy caterer's number for n = 9 cuts, n(n+1)/2 + 1.
; Expected: 46 -> exit code 46
section .text
    global _start

_start:
    mov rax, 9
    lea rbx, [rax + 1]
    imul rax, rbx           ; n(n+1)
    shr rax, 1              ; / 2
    inc rax
    mov rdi, rax
    mov rax, 60
    syscall
