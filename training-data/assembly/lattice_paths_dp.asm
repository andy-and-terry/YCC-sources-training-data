; x86-64 NASM: lattice paths in a 3x3 grid via DP row of 4 qwords
; exit status: 20
section .bss
    row resq 4

section .text
    global _start

_start:
    mov rcx, 4
    mov rdi, row
    mov rax, 1
    rep stosq                  ; row = [1,1,1,1]
    mov r8, 3                  ; passes
.pass:
    mov r9, 1
.col:
    mov rax, [row + r9*8]
    add rax, [row + r9*8 - 8]
    mov [row + r9*8], rax
    inc r9
    cmp r9, 4
    jl .col
    dec r8
    jnz .pass
    mov rdi, [row + 24]
    mov rax, 60
    syscall
