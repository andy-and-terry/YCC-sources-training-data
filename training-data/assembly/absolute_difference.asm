; x86-64 NASM: |a - b| using sub and conditional negate
; exit status: 13
section .text
    global _start

_start:
    mov rax, 7
    mov rbx, 20
    sub rax, rbx               ; -13
    jns .done
    neg rax
.done:
    mov rdi, rax
    mov rax, 60
    syscall
