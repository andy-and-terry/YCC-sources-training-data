; x86-64 NASM: multi-line macro with parameters
; exit status: 35
%macro add_into 3
    mov %1, %2
    add %1, %3
%endmacro

section .text
    global _start

_start:
    add_into rdi, 20, 15
    mov rax, 60
    syscall
