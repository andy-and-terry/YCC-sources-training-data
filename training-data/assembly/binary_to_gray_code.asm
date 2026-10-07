; x86-64 NASM: convert a binary value to its Gray code equivalent
; gray = binary XOR (binary >> 1)
section .text
    global _start

_start:
    mov rax, 0b1011        ; 11 decimal
    mov rbx, rax
    shr rbx, 1
    xor rax, rbx            ; gray code result
    mov rdi, rax
    mov rax, 60
    syscall
