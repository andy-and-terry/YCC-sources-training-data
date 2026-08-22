; x86-64 NASM: demonstrate push/pop stack usage
section .text
    global _start

_start:
    mov rax, 1
    mov rbx, 2
    mov rcx, 3
    push rax
    push rbx
    push rcx
    pop rdx      ; 3
    pop rsi      ; 2
    pop rdi      ; 1
    ; rdi + rsi + rdx = 6
    add rdi, rsi
    add rdi, rdx
    mov rax, 60
    syscall
