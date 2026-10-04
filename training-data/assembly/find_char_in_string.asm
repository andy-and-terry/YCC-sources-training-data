; x86-64 NASM: find first index of a character in a string using repne scasb
section .data
    text db "assembly", 0
    len  equ $ - text - 1

section .text
    global _start

_start:
    lea rdi, [text]
    mov al, 'm'
    mov rcx, len
    cld
    repne scasb
    jne .not_found
    lea rax, [rdi - 1]
    lea rbx, [text]
    sub rax, rbx           ; index = 4
    mov rdi, rax
    jmp .exit
.not_found:
    mov rdi, 255
.exit:
    mov rax, 60
    syscall
