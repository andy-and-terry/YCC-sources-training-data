; x86-64 NASM: 4^3 as the sum of 4 consecutive odd numbers starting at n*n-n+1
section .text
    global _start

_start:
    mov rcx, 4          ; n
    mov rax, rcx
    imul rax, rcx
    sub rax, rcx
    inc rax             ; start = n*n - n + 1 = 13
    xor rdx, rdx        ; sum
    mov rbx, rcx        ; loop counter
sum_loop:
    add rdx, rax
    add rax, 2          ; next odd number
    dec rbx
    jnz sum_loop
    mov rdi, rdx        ; 13 + 15 + 17 + 19 = 64
    mov rax, 60
    syscall
