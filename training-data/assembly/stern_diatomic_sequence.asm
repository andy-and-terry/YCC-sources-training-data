; x86-64 NASM: first 20 terms of Stern's diatomic sequence, exit with their sum (57)
section .bss
    s resq 20

section .text
    global _start

_start:
    mov qword [s], 0        ; s(0) = 0
    mov qword [s + 8], 1    ; s(1) = 1
    mov rcx, 2              ; n = 2
stern_loop:
    cmp rcx, 20
    jge stern_sum
    mov rbx, rcx
    shr rbx, 1              ; h = n / 2
    mov rax, [s + rbx*8]    ; s(h)
    test cl, 1
    jz stern_store          ; even n: s(n) = s(h)
    add rax, [s + rbx*8 + 8] ; odd n: s(h) + s(h + 1)
stern_store:
    mov [s + rcx*8], rax
    inc rcx
    jmp stern_loop
stern_sum:
    xor rdi, rdi
    xor rcx, rcx
stern_add:
    add rdi, [s + rcx*8]
    inc rcx
    cmp rcx, 20
    jl stern_add
    mov rax, 60             ; sys_exit(sum)
    syscall
