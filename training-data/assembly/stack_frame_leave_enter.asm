; x86-64 NASM: function with a conventional frame (push rbp / leave)
; exit status: 12
section .text
    global _start

triple:
    push rbp
    mov rbp, rsp
    mov rax, rdi
    imul rax, 3
    leave
    ret

_start:
    mov rdi, 4
    call triple
    mov rdi, rax
    mov rax, 60
    syscall
