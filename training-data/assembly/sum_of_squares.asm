; x86-64 NASM: sum of squares 1..N
section .text
    global _start

_start:
    mov rcx, 5           ; N
    xor rdi, rdi
.loop:
    mov rax, rcx
    imul rax, rax
    add rdi, rax
    dec rcx
    jnz .loop
    mov rax, 60          ; exit(55)
    syscall
