; x86-64 NASM: Wilson's theorem for n = 7: (n-1)! mod n == n-1 means prime
; exit status: 1 (prime)
section .text
    global _start

_start:
    mov r8, 7                  ; n
    mov rax, 1                 ; factorial accumulator
    mov rcx, 2
.loop:
    cmp rcx, r8
    jae .check
    mul rcx
    xor rdx, rdx
    div r8
    mov rax, rdx               ; keep remainder
    inc rcx
    jmp .loop
.check:
    mov rdi, 0
    lea rbx, [r8 - 1]
    cmp rax, rbx
    jne .exit
    mov rdi, 1
.exit:
    mov rax, 60
    syscall
