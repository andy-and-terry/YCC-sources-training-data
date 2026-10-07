; x86-64 NASM: count trailing zero bits using BSF
section .text
    global _start

_start:
    mov rax, 0x50        ; 0101 0000 -> 4 trailing zeros
    test rax, rax
    jz .zero
    bsf rdi, rax         ; index of lowest set bit
    jmp .exit
.zero:
    mov rdi, 64
.exit:
    mov rax, 60
    syscall
