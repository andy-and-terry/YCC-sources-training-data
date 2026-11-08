; x86-64 NASM (Linux): swap two registers using XOR, exit code 3
global _start
section .text
_start:
    mov rax, 3
    mov rbx, 9
    xor rax, rbx
    xor rbx, rax
    xor rax, rbx        ; rax=9, rbx=3
    mov rdi, rbx
    mov rax, 60
    syscall
