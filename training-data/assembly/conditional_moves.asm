; x86-64 NASM: use cmovg to select the max of two values branchlessly
section .text
    global _start

_start:
    mov rax, 7            ; a
    mov rbx, 12           ; b
    mov rcx, rax
    cmp rbx, rax
    cmovg rcx, rbx         ; rcx = max(a, b)
    mov rdi, rcx
    mov rax, 60
    syscall
