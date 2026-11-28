; x86-64 NASM: max(|1-4|, |2-6|) -> 4
; exit status: 4
section .text
    global _start

_start:
    mov rax, 1
    sub rax, 4
    mov rbx, rax
    sar rbx, 63
    xor rax, rbx
    sub rax, rbx        ; |dx| = 3
    mov rcx, 2
    sub rcx, 6
    mov rdx, rcx
    sar rdx, 63
    xor rcx, rdx
    sub rcx, rdx        ; |dy| = 4
    cmp rax, rcx
    cmovb rax, rcx      ; rax = max
    mov rdi, rax
    mov rax, 60
    syscall
