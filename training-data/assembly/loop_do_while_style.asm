; x86-64 NASM: do-while loop; body runs at least once
; exit status: 1
section .text
    global _start

_start:
    xor rdi, rdi
    mov rcx, 100               ; condition already false
.body:
    inc rdi
    cmp rcx, 10
    jl .body                   ; not taken
    mov rax, 60
    syscall
