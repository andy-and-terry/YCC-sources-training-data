; x86-64 NASM: sum of squares 1..5 (= 55), exit status holds the result
section .text
    global _start

_start:
    mov rcx, 1
    xor rax, rax
square_loop:
    mov rdx, rcx
    imul rdx, rcx
    add rax, rdx
    inc rcx
    cmp rcx, 5
    jle square_loop
    mov rdi, rax
    mov rax, 60
    syscall
