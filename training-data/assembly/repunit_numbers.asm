; x86-64 NASM: fifth repunit (11111) built by r = r*10 + 1
; exit status: 103  (11111 & 0xFF)
section .text
    global _start

_start:
    xor rax, rax
    mov rcx, 5
.loop:
    imul rax, rax, 10
    inc rax
    dec rcx
    jnz .loop
    mov rdi, rax
    mov rax, 60
    syscall
