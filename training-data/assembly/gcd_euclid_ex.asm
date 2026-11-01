; x86-64 NASM: gcd(48, 18) = 6 via Euclid
section .text
    global _start
_start:
    mov rax, 48
    mov rbx, 18
.loop:
    test rbx, rbx
    jz .done
    xor rdx, rdx
    div rbx
    mov rax, rbx
    mov rbx, rdx
    jmp .loop
.done:
    mov rdi, rax
    mov rax, 60
    syscall
