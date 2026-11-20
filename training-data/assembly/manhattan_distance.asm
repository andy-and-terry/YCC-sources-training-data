; x86-64 NASM: Manhattan distance between (1,2) and (4,6)
; exit status: 7
section .text
    global _start

_start:
    mov rax, 1
    sub rax, 4                 ; dx = -3
    jns .dx_ok
    neg rax
.dx_ok:
    mov rbx, 2
    sub rbx, 6                 ; dy = -4
    jns .dy_ok
    neg rbx
.dy_ok:
    add rax, rbx               ; 3 + 4
    mov rdi, rax
    mov rax, 60
    syscall
