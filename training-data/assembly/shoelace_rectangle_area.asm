; x86-64 NASM: doubled shoelace area of (0,0) (4,0) (4,3) (0,3), halved at the end
; exit status: 12
section .data
    xs dq 0, 4, 4, 0
    ys dq 0, 0, 3, 3

section .text
    global _start

_start:
    xor r8, r8                 ; sum
    xor rcx, rcx               ; i
.loop:
    lea rdx, [rcx + 1]
    and rdx, 3                 ; j = (i+1) mod 4
    mov rax, [xs + rcx*8]
    imul rax, [ys + rdx*8]
    add r8, rax
    mov rax, [xs + rdx*8]
    imul rax, [ys + rcx*8]
    sub r8, rax
    inc rcx
    cmp rcx, 4
    jl .loop
    mov rax, r8
    cqo
    xor rax, rdx               ; abs via sign mask
    sub rax, rdx
    shr rax, 1
    mov rdi, rax
    mov rax, 60
    syscall
