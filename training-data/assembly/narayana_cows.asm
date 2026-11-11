; x86-64 NASM (Linux): Narayana's cows N(n)=N(n-1)+N(n-3)
; Fills `results` with the first ten terms; exits with the 10th term.
section .data
    results dq 1, 1, 1, 0, 0, 0, 0, 0, 0, 0

section .text
    global _start

_start:
    mov rcx, 3                 ; i = 3
.next:
    mov rdx, rcx
    sub rdx, 1
    mov rax, [results + rdx * 8]
    mov rdx, rcx
    sub rdx, 3
    add rax, [results + rdx * 8]
    mov [results + rcx * 8], rax
    inc rcx
    cmp rcx, 10
    jl .next
    mov rdi, [results + 9 * 8]
    mov rax, 60
    syscall
