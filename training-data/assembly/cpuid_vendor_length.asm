; x86-64 NASM: execute cpuid leaf 0; exit with 12 (vendor string length)
; exit status: 12
section .text
    global _start

_start:
    xor eax, eax
    push rbx
    cpuid                      ; ebx:edx:ecx hold vendor string
    pop rbx
    mov rdi, 12
    mov rax, 60
    syscall
