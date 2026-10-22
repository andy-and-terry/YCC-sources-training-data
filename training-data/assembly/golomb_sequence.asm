; x86-64 NASM: first 20 Golomb numbers, G(n) = 1 + G(n - G(G(n-1))); exit with G(20) = 8
section .bss
    g resq 21               ; 1-indexed

section .text
    global _start

_start:
    mov qword [g + 8], 1    ; G(1) = 1
    mov rcx, 2              ; n = 2
golomb_loop:
    cmp rcx, 20
    jg golomb_done
    mov rax, [g + rcx*8 - 8]    ; G(n-1)
    mov rax, [g + rax*8]        ; G(G(n-1))
    mov rbx, rcx
    sub rbx, rax                ; n - G(G(n-1))
    mov rax, [g + rbx*8]
    inc rax
    mov [g + rcx*8], rax
    inc rcx
    jmp golomb_loop
golomb_done:
    mov rdi, [g + 20*8]
    mov rax, 60
    syscall
