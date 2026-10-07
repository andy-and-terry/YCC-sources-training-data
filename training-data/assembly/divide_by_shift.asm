; x86-64 NASM: divide an unsigned value by a power of two using a right
; shift, with the remainder recovered via a mask
section .text
    global _start

_start:
    mov rax, 77            ; value
    mov rcx, 4              ; divide by 2^4 = 16
    mov rbx, rax
    shr rax, cl              ; quotient = 77 / 16 = 4
    mov rdx, 1
    shl rdx, cl
    dec rdx                  ; mask = 2^4 - 1 = 15
    and rbx, rdx              ; remainder = 77 mod 16 = 13
    mov rdi, rax
    mov rax, 60
    syscall
