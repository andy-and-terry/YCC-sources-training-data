; x86-64 NASM: Kernighan population count of 0xF0F0
global _start
section .text
_start:
    mov rax, 0xF0F0
    xor rcx, rcx
.again:
    test rax, rax
    jz .done
    lea rdx, [rax - 1]
    and rax, rdx       ; clear lowest set bit
    inc rcx
    jmp .again
.done:
    mov rdi, rcx       ; exit status = 8
    mov rax, 60
    syscall
