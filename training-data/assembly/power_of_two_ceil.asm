; x86-64 NASM: round a value up to the next power of two
section .text
    global _start

_start:
    mov rax, 19           ; expect result 32
    dec rax
    mov rcx, 1
spread_loop:
    cmp rcx, 32
    jg spread_done
    mov rdx, rax
    shr rdx, cl
    or rax, rdx
    shl rcx, 1
    jmp spread_loop
spread_done:
    inc rax
    mov rdi, rax
    mov rax, 60
    syscall
