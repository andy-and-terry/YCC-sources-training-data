; x86-64 NASM: Fermat test, 2^(n-1) mod n for n = 561 (Carmichael number)
; exit status: 1  (result is 1, so 561 "passes" despite being composite)
section .text
    global _start

_start:
    mov r8, 561                ; modulus n
    mov r9, 560                ; exponent n-1
    mov r10, 2                 ; base
    mov r11, 1                 ; result
.loop:
    test r9, r9
    jz .done
    test r9, 1
    jz .square
    mov rax, r11
    mul r10
    xor rdx, rdx
    div r8
    mov r11, rdx
.square:
    mov rax, r10
    mul r10
    xor rdx, rdx
    div r8
    mov r10, rdx
    shr r9, 1
    jmp .loop
.done:
    mov rdi, r11
    mov rax, 60
    syscall
