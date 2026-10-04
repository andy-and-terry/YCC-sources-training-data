; x86-64 NASM: compute parity (1 if odd number of set bits) by folding with xor
section .text
    global _start

parity:
    ; rdi = value -> rax = 0 or 1
    mov rax, rdi
    mov rcx, rax
    shr rcx, 32
    xor rax, rcx
    mov rcx, rax
    shr rcx, 16
    xor rax, rcx
    mov rcx, rax
    shr rcx, 8
    xor rax, rcx
    mov rcx, rax
    shr rcx, 4
    xor rax, rcx
    mov rcx, rax
    shr rcx, 2
    xor rax, rcx
    mov rcx, rax
    shr rcx, 1
    xor rax, rcx
    and rax, 1
    ret

_start:
    mov rdi, 0b10110111    ; six set bits -> parity 0
    call parity
    mov rdi, rax
    mov rax, 60
    syscall
