; x86-64 NASM: |x1-x2| + |y1-y2| for (1,2) and (4,6)
; branch-free abs: (v ^ (v>>63)) - (v>>63)
; exit status: 7
section .text
    global _start

_start:
    mov rax, 1
    sub rax, 4
    mov rbx, rax
    sar rbx, 63
    xor rax, rbx
    sub rax, rbx        ; rax = 3
    mov rcx, 2
    sub rcx, 6
    mov rdx, rcx
    sar rdx, 63
    xor rcx, rdx
    sub rcx, rdx        ; rcx = 4
    add rax, rcx
    mov rdi, rax
    mov rax, 60
    syscall
