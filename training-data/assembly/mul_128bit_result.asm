; x86-64 NASM: full 64x64 -> 128-bit multiply using the one-operand mul
; 0x100000000 * 0x100000000 = 2^64 -> rdx:rax = 1:0
section .text
    global _start

_start:
    mov rax, 0x100000000
    mov rbx, 0x100000000
    mul rbx                    ; rdx:rax = rax * rbx

    ; rdx = high 64 bits (1), rax = low 64 bits (0)
    mov rdi, rdx
    add rdi, rax               ; exit status 1
    mov rax, 60
    syscall
