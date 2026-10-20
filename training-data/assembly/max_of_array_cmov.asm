; x86-64 NASM: maximum of an array using cmov
; exit status: 42
section .data
    nums dq 17, 42, 8, 33, 5
section .text
    global _start

_start:
    mov rax, [nums]
    mov rcx, 1
loop_top:
    mov rbx, [nums + rcx*8]
    cmp rbx, rax
    cmovg rax, rbx
    inc rcx
    cmp rcx, 5
    jl loop_top
    mov rdi, rax
    mov rax, 60
    syscall
