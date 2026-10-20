; x86-64 NASM: function with a stack frame and two locals, returns a*b + a
; exit status: 28
section .text
    global _start

mulplus:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
    mov rax, [rbp - 8]
    imul rax, [rbp - 16]
    add rax, [rbp - 8]
    leave
    ret

_start:
    mov rdi, 4
    mov rsi, 6
    call mulplus
    mov rdi, rax
    mov rax, 60
    syscall
