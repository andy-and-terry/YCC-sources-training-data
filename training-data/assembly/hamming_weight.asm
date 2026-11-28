; x86-64 NASM: population count with the n &= n-1 trick
; exit status: 6
section .text
    global _start

_start:
    mov rax, 0xB7
    xor rdi, rdi
.loop:
    test rax, rax
    jz .done
    lea rbx, [rax - 1]
    and rax, rbx
    inc rdi
    jmp .loop
.done:
    mov rax, 60
    syscall
