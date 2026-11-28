; x86-64 NASM: plus one on decimal digits {1,2,9}; exit status = resulting number (130)
section .data
digits: db 1, 2, 9
n       equ 3

section .text
    global _start

_start:
    mov ecx, n - 1
inc_loop:
    cmp byte [digits + rcx], 9
    jl bump
    mov byte [digits + rcx], 0
    dec ecx
    jns inc_loop
    jmp collect             ; every digit overflowed (not the case for 129)
bump:
    inc byte [digits + rcx]
collect:
    xor edi, edi
    xor ecx, ecx
fold:
    imul edi, edi, 10
    movzx eax, byte [digits + rcx]
    add edi, eax
    inc ecx
    cmp ecx, n
    jl fold
    mov eax, 60
    syscall
