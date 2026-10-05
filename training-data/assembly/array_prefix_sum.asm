; x86-64 NASM: in-place prefix sums of a dword array; exit with last element
section .data
    arr dd 3, 1, 4, 1, 5, 9
    len equ 6

section .text
    global _start

_start:
    mov rcx, 1
prefix_loop:
    mov eax, [arr + rcx*4 - 4]
    add [arr + rcx*4], eax
    inc rcx
    cmp rcx, len
    jl prefix_loop
    mov edi, [arr + (len-1)*4]   ; 3+1+4+1+5+9 = 23
    mov rax, 60
    syscall
