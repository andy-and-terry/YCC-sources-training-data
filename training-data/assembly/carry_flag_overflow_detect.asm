; x86-64 NASM: detect unsigned overflow with jc
; exit status: 1
section .text
    global _start

_start:
    mov al, 200
    add al, 100                ; 300 wraps, CF = 1
    jc .overflow
    xor rdi, rdi
    jmp .done
.overflow:
    mov rdi, 1
.done:
    mov rax, 60
    syscall
