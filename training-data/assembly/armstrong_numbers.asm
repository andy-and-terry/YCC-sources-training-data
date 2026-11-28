; x86-64 NASM: is 153 an Armstrong number? (1^3 + 5^3 + 3^3)
; exit status: 1 if yes (expected: 1)
section .text
    global _start

_start:
    mov r8, 153
    mov rax, r8
    xor rcx, rcx                ; sum
.digit:
    xor rdx, rdx
    mov rbx, 10
    div rbx                     ; rdx = digit
    mov rsi, rdx
    imul rsi, rdx
    imul rsi, rdx               ; digit^3
    add rcx, rsi
    test rax, rax
    jnz .digit
    xor rdi, rdi
    cmp rcx, r8
    sete dil
    mov rax, 60
    syscall
