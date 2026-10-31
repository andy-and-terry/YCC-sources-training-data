; x86-64 NASM: is 72 a powerful number (every prime factor appears at least squared)?
section .text
    global _start

_start:
    mov r8, 72          ; n
    mov rcx, 2          ; p
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
    mov rax, r8
    xor rdx, rdx
    mov rbx, rcx
    imul rbx, rcx
    div rbx
    test rdx, rdx
    jnz not_powerful    ; p divides n but p^2 does not
strip:
    mov rax, r8
    xor rdx, rdx
    div rcx
    test rdx, rdx
    jnz next_p
    mov r8, rax
    jmp strip
next_p:
    inc rcx
    jmp outer
after:
    xor rdi, rdi
    cmp r8, 1
    sete dil
    jmp exit
not_powerful:
    xor rdi, rdi
exit:
    mov rax, 60
    syscall
