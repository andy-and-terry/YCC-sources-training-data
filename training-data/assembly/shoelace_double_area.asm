; x86-64 NASM: twice the area of the rectangle (0,0) (4,0) (4,3) (0,3) -> 24
section .data
    xs dq 0, 4, 4, 0
    ys dq 0, 0, 3, 3
section .text
    global _start

_start:
    xor r8, r8              ; accumulator
    xor rcx, rcx            ; i
.loop:
    lea rdx, [rcx + 1]
    and rdx, 3              ; j = (i + 1) % 4
    lea rsi, [rel xs]
    lea rdi, [rel ys]
    mov rax, [rsi + rcx * 8]
    imul rax, [rdi + rdx * 8]
    add r8, rax
    mov rax, [rsi + rdx * 8]
    imul rax, [rdi + rcx * 8]
    sub r8, rax
    inc rcx
    cmp rcx, 4
    jl .loop
    mov rdi, r8
    mov eax, 60
    syscall
