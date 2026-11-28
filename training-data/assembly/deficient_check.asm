; x86-64 NASM: is 15 deficient? sigma(15)=1+3+5+15=24 < 30
; exit status: 1 (deficient) or 0
section .text
    global _start

_start:
    mov r8, 15          ; n
    xor r9, r9          ; sigma
    mov rcx, 1
.loop:
    xor rdx, rdx
    mov rax, r8
    div rcx
    test rdx, rdx
    jnz .next
    add r9, rcx
.next:
    inc rcx
    cmp rcx, r8
    jbe .loop
    lea rax, [r8 + r8]
    xor rdi, rdi
    cmp r9, rax
    setb dil
    mov rax, 60
    syscall
