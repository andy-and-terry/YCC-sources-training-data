; x86-64 NASM: compute base^exp iteratively
section .text
    global _start

_start:
    mov rax, 1          ; result = 1
    mov rbx, 2           ; base
    mov rcx, 10          ; exponent
power_loop:
    cmp rcx, 0
    je done
    imul rax, rbx
    dec rcx
    jmp power_loop
done:
    mov rdi, rax
    mov rax, 60
    syscall
