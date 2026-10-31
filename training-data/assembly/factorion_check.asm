; x86-64 NASM: is 145 a factorion? (1! + 4! + 5! = 145) exit 1 if yes, 0 if no
section .data
    fact dq 1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880

section .text
    global _start

_start:
    mov r8, 145         ; n
    mov rax, r8
    mov rbx, 10
    xor rsi, rsi        ; sum
digit_loop:
    test rax, rax
    jz compare
    xor rdx, rdx
    div rbx
    add rsi, [fact + rdx * 8]
    jmp digit_loop
compare:
    xor rdi, rdi
    cmp rsi, r8
    sete dil
    mov rax, 60
    syscall
