; call a square function, exit with result 49
section .text
global _start
square:
    mov rax, rdi
    imul rax, rax
    ret
_start:
    mov rdi, 7
    call square
    mov rdi, rax
    mov rax, 60
    syscall
