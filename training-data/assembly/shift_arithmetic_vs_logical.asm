; x86-64 NASM: sar keeps the sign bit, shr does not
; exit status: 1
section .text
    global _start

_start:
    mov rax, -64
    sar rax, 3                 ; -8
    mov rbx, -64
    shr rbx, 60                ; 15
    xor rdi, rdi
    cmp rax, -8
    jne .done
    cmp rbx, 15
    jne .done
    mov rdi, 1
.done:
    mov rax, 60
    syscall
