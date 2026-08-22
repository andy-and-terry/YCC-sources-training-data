; x86-64 NASM: compute GCD via Euclid's algorithm
section .text
    global _start

_start:
    mov rax, 48
    mov rbx, 18
gcd_loop:
    cmp rbx, 0
    je gcd_done
    xor rdx, rdx
    div rbx
    mov rax, rbx
    mov rbx, rdx
    jmp gcd_loop
gcd_done:
    ; rax now holds the GCD (6); exit with it as status
    mov rdi, rax
    mov rax, 60
    syscall
