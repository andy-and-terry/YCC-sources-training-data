; x86-64 NASM: isolate the lowest set bit of a number via n & (-n)
section .text
    global _start

_start:
    mov rax, 44          ; n = 0b101100
    mov rbx, rax
    neg rbx               ; rbx = -n (two's complement)
    and rax, rbx           ; rax = n & -n = lowest set bit isolated (4)
    mov rdi, rax
    mov rax, 60
    syscall
