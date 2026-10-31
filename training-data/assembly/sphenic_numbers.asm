; x86-64 NASM: is 30 sphenic (product of three distinct primes)?
section .text
    global _start

_start:
    mov r8, 30          ; n
    mov rcx, 2          ; p
    xor r9, r9          ; distinct primes
outer:
    mov rax, rcx
    imul rax, rcx
    cmp rax, r8
    ja after
    mov rax, r8
    xor rdx, rdx
    div rcx
    test rdx, rdx
    jnz next_p
    mov r8, rax         ; n /= p
    xor rdx, rdx
    div rcx
    test rdx, rdx
    jz not_sphenic      ; p^2 divides n
    inc r9
next_p:
    inc rcx
    jmp outer
after:
    cmp r8, 1
    jbe check
    inc r9
check:
    xor rdi, rdi
    cmp r9, 3
    sete dil
    jmp exit
not_sphenic:
    xor rdi, rdi
exit:
    mov rax, 60
    syscall
