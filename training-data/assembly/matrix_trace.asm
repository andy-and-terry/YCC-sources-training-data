; x86-64 NASM: sum the diagonal of a 3x3 matrix
; exit status: 15
section .data
    m dd 1, 2, 3
      dd 4, 5, 6
      dd 7, 8, 9

section .text
    global _start

_start:
    xor edi, edi
    xor ecx, ecx
.loop:
    lea rax, [rcx * 4]       ; diagonal index = i*4 dwords
    mov edx, [m + rax * 4 - 0]
    add edi, edx
    inc ecx
    cmp ecx, 3
    jl .loop
    mov rax, 60
    syscall
