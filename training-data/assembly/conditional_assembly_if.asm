; x86-64 NASM: preprocessor conditionals select code at assemble time
; exit status: 2
%define VERSION 2

section .text
    global _start

_start:
%if VERSION == 1
    mov rdi, 1
%elif VERSION == 2
    mov rdi, 2
%else
    mov rdi, 0
%endif
    mov rax, 60
    syscall
