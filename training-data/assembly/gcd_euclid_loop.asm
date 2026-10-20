; x86-64 NASM: greatest common divisor of 84 and 36 by Euclid's algorithm
; exit status: 12
section .text
    global _start

_start:
    mov rax, 84
    mov rbx, 36
gcd_loop:
    test rbx, rbx
    jz done
    xor rdx, rdx
    div rbx
    mov rax, rbx
    mov rbx, rdx
    jmp gcd_loop
done:
    mov rdi, rax
    mov rax, 60
    syscall
