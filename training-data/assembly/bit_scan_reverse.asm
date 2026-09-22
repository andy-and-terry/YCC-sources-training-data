; x86-64 NASM: find the index of the highest set bit using bsr
section .text
    global _start

_start:
    mov rax, 0b00010110    ; n = 22, highest set bit at index 4
    bsr rbx, rax             ; rbx = index of most significant set bit
    mov rdi, rbx
    mov rax, 60
    syscall
