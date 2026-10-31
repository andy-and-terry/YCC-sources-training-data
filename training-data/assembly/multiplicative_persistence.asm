; x86-64 NASM: multiplicative persistence of 999 (999 -> 729 -> 126 -> 12 -> 2 = 4 steps)
section .text
    global _start

_start:
    mov rax, 999
    mov rbx, 10
    xor r8, r8          ; steps
outer:
    cmp rax, 10
    jb finished
    mov rsi, 1          ; product
inner:
    test rax, rax
    jz inner_done
    xor rdx, rdx
    div rbx
    imul rsi, rdx
    jmp inner
inner_done:
    mov rax, rsi
    inc r8
    jmp outer
finished:
    mov rdi, r8
    mov rax, 60
    syscall
