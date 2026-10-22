; x86-64 NASM: first 10 triangular, pentagonal and hexagonal numbers
; P(s, n) = ((s - 2) * n * n - (s - 4) * n) / 2; exit with the 10th hexagonal (190)
section .data
    sides dq 3, 5, 6

section .bss
    table resq 30

section .text
    global _start

_start:
    xor r8, r8              ; side index
    xor r9, r9              ; table index
side_loop:
    cmp r8, 3
    jge poly_done
    mov rsi, [sides + r8*8] ; s
    mov rcx, 1              ; n
num_loop:
    mov rax, rsi
    sub rax, 2
    imul rax, rcx
    imul rax, rcx           ; (s-2)*n*n
    mov rbx, rsi
    sub rbx, 4
    imul rbx, rcx           ; (s-4)*n
    sub rax, rbx
    shr rax, 1              ; / 2
    mov [table + r9*8], rax
    inc r9
    inc rcx
    cmp rcx, 10
    jle num_loop
    inc r8
    jmp side_loop
poly_done:
    mov rdi, [table + 29*8]
    mov rax, 60
    syscall
