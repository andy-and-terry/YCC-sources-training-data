; x86-64 NASM: sum of 5 qwords; exit status = 15
section .data
arr dq 1, 2, 3, 4, 5
section .text
    global _start
_start:
    xor rax, rax
    xor rcx, rcx
.loop:
    add rax, [arr + rcx*8]
    inc rcx
    cmp rcx, 5
    jl .loop
    mov rdi, rax
    mov rax, 60
    syscall
