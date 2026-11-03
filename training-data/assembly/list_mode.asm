; x86-64 NASM: highest frequency in a small list (items 1,2,2,3,3,3)
; exit status: 3
section .data
items:  db 1, 2, 2, 3, 3, 3
counts: times 8 db 0

section .text
    global _start

_start:
    xor rcx, rcx
    xor rdi, rdi
.tally:
    movzx rax, byte [items + rcx]
    inc byte [counts + rax]
    movzx rbx, byte [counts + rax]
    cmp rbx, rdi
    jle .skip
    mov rdi, rbx
.skip:
    inc rcx
    cmp rcx, 6
    jl .tally
    mov rax, 60
    syscall
