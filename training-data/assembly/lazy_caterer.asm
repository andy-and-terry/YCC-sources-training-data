; x86-64 NASM (Linux): Lazy caterer sequence: max pieces from n cuts
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
    shr rax, 1
    inc rax
    mov [results + rcx * 8], rax
    inc rcx
    cmp rcx, 10
    jl .next
    mov rdi, [results + 9 * 8]
    mov rax, 60                ; sys_exit
    syscall
