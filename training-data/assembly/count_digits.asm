; x86-64 NASM: count the number of digits in a positive integer
section .text
    global _start

_start:
    mov rax, 98765
    xor rbx, rbx          ; digit count = 0
    mov rcx, 10
count_loop:
    xor rdx, rdx
    div rcx
    inc rbx
    cmp rax, 0
    jne count_loop
    mov rdi, rbx
    mov rax, 60
    syscall
