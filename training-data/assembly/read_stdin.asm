; x86-64 NASM: read a line of input from stdin and echo it back to stdout
section .bss
    buffer resb 64

section .text
    global _start

_start:
    mov rax, 0              ; sys_read
    mov rdi, 0              ; fd = stdin
    lea rsi, [buffer]
    mov rdx, 64
    syscall                 ; rax = number of bytes actually read

    mov rdx, rax            ; write back exactly what was read
    mov rax, 1               ; sys_write
    mov rdi, 1               ; fd = stdout
    lea rsi, [buffer]
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
