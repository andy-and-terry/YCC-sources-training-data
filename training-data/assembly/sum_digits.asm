; x86-64 NASM: sum the digits of a number
section .text
    global _start

_start:
    mov rax, 12345
    xor rbx, rbx          ; sum = 0
digit_loop:
    cmp rax, 0
    je done
    xor rdx, rdx
    mov rcx, 10
    div rcx
    add rbx, rdx
    jmp digit_loop
done:
    mov rdi, rbx
    mov rax, 60
    syscall
