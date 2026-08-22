; x86-64 NASM: compute LCM via GCD
section .text
    global _start

_start:
    mov rax, 4          ; a
    mov rbx, 6           ; b
    mov r8, rax
    mov r9, rbx
gcd_loop:
    cmp r9, 0
    je gcd_done
    xor rdx, rdx
    mov rax, r8
    div r9
    mov r8, r9
    mov r9, rdx
    jmp gcd_loop
gcd_done:
    ; r8 = gcd(a, b); lcm = a / gcd * b
    mov rax, 4
    xor rdx, rdx
    div r8
    imul rax, rbx
    mov rdi, rax
    mov rax, 60
    syscall
