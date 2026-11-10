; x86-64 NASM: cake numbers (n^3 + 5n + 6) / 6 for n = 7 -> exit code 64
section .text
    global _start

_start:
    mov rcx, 7
    mov rax, rcx
    imul rax, rcx
    imul rax, rcx        ; n^3
    lea rbx, [rcx + rcx*4]
    add rax, rbx         ; + 5n
    add rax, 6
    xor rdx, rdx
    mov rbx, 6
    div rbx              ; / 6
    mov rdi, rax
    mov rax, 60
    syscall
