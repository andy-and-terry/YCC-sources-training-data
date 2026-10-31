; x86-64 NASM: is 15 a semiprime (exactly two prime factors with multiplicity)?
section .text
    global _start

_start:
    mov r8, 15          ; n
    mov rcx, 2          ; p
    xor r9, r9          ; count
outer:
    mov rax, rcx
    imul rax, rcx
    cmp rax, r8
    ja after
inner:
    mov rax, r8
    xor rdx, rdx
    div rcx
    test rdx, rdx
    jnz next_p
    mov r8, rax
    inc r9
    jmp inner
next_p:
    inc rcx
    jmp outer
after:
    cmp r8, 1
    jbe check
    inc r9
check:
    xor rdi, rdi
    cmp r9, 2
    sete dil
    mov rax, 60
    syscall
