; x86-64 NASM: fill an array with a repeated value
section .bss
    array resq 5

section .text
    global _start

_start:
    lea rdi, [array]
    mov rcx, 5
    mov rax, 7
fill_loop:
    mov [rdi], rax
    add rdi, 8
    loop fill_loop
    mov rdi, [array]
    mov rax, 60
    syscall
