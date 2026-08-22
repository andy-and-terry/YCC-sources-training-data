; x86-64 NASM: check whether a number is prime
section .text
    global _start

_start:
    mov rbx, 17           ; number to test
    cmp rbx, 2
    jl not_prime
    je is_prime
    mov rcx, 2            ; divisor

check_loop:
    mov rax, rcx
    imul rax, rcx
    cmp rax, rbx
    jg is_prime
    mov rax, rbx
    xor rdx, rdx
    div rcx
    cmp rdx, 0
    je not_prime
    inc rcx
    jmp check_loop

is_prime:
    mov rdi, 1
    jmp done
not_prime:
    mov rdi, 0
done:
    mov rax, 60
    syscall
