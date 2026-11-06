; x86-64 NASM: peak value of the Collatz sequence starting at 27 (9232)
; exit status: 16  (9232 & 0xFF)
section .text
    global _start

_start:
    mov rax, 27
    mov rbx, rax               ; best
.loop:
    cmp rax, 1
    je .done
    test rax, 1
    jnz .odd
    shr rax, 1
    jmp .check
.odd:
    lea rax, [rax + rax*2 + 1]
.check:
    cmp rax, rbx
    jbe .loop
    mov rbx, rax
    jmp .loop
.done:
    mov rdi, rbx
    mov rax, 60
    syscall
