; x86-64 NASM: fill dword array using rep stosd then read back
; exit status: 28
section .bss
    arr resd 4

section .text
    global _start

_start:
    cld
    lea rdi, [arr]
    mov eax, 7
    mov rcx, 4
    rep stosd
    mov eax, [arr]
    add eax, [arr + 4]
    add eax, [arr + 8]
    add eax, [arr + 12]
    mov edi, eax
    mov rax, 60
    syscall
