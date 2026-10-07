; x86-64 NASM: multiply by constants using LEA and shifts
section .text
    global _start

_start:
    mov rax, 7
    lea rbx, [rax + rax*4]   ; x * 5 = 35
    lea rcx, [rbx + rax*2]   ; 35 + 14 = 49 (x * 7)
    shl rcx, 1               ; 98 (x * 14)
    mov rdi, rcx
    mov rax, 60              ; exit(98)
    syscall
