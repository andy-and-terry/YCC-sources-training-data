; x86-64 NASM: compute 10! iteratively into rax
section .text
    global _start

_start:
    mov rax, 1          ; result = 1
    mov rcx, 10         ; counter = 10
fact_loop:
    cmp rcx, 1
    jle fact_done
    imul rax, rcx
    dec rcx
    jmp fact_loop
fact_done:
    ; rax now holds 10! (3628800); exit with low byte as status
    mov rdi, rax
    mov rax, 60
    syscall
