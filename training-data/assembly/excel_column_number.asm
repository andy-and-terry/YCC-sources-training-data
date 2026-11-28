; x86-64 NASM: spreadsheet title "AB" -> column number; exit status = 28
section .data
title:  db "AB"
len     equ 2

section .text
    global _start

_start:
    xor edi, edi            ; n
    xor ecx, ecx
next_char:
    imul edi, edi, 26
    movzx eax, byte [title + rcx]
    sub eax, 'A' - 1
    add edi, eax
    inc ecx
    cmp ecx, len
    jl next_char
    mov eax, 60
    syscall
