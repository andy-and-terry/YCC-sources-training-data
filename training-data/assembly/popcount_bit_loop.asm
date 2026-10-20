; x86-64 NASM: count set bits in 0xF0F1 by shifting
; exit status: 9
section .text
    global _start

_start:
    mov rax, 0xF0F1
    xor rdi, rdi
bit_loop:
    test rax, rax
    jz done
    mov rbx, rax
    and rbx, 1
    add rdi, rbx
    shr rax, 1
    jmp bit_loop
done:
    mov rax, 60
    syscall
