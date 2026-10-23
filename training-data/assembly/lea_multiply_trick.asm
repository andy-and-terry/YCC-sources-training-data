; x86-64 NASM: multiply by 5 and 9 using lea instead of imul
section .text
    global _start

_start:
    mov rax, 7
    lea rbx, [rax + rax*4]   ; 7 * 5 = 35
    lea rcx, [rax + rax*8]   ; 7 * 9 = 63
    lea rdi, [rbx + rcx]     ; 98
    mov rax, 60
    syscall
