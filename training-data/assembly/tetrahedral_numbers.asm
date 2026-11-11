; x86-64 NASM (Linux): Tetrahedral numbers n(n+1)(n+2)/6
; Stores the first ten terms in `results`; exits with the 10th term (n = 9).
section .bss
    results resq 10

section .text
    global _start

_start:
    xor rcx, rcx               ; n = 0
.next:
    lea rax, [rcx + 1]
    imul rax, rcx
    lea rdx, [rcx + 2]
    imul rax, rdx
    xor edx, edx
    mov rbx, 6
    div rbx
    mov [results + rcx * 8], rax
    inc rcx
    cmp rcx, 10
    jl .next
    mov rdi, [results + 9 * 8]
    mov rax, 60                ; sys_exit
    syscall
