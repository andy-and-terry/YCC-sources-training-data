; x86-64 NASM: compare-and-swap using cmpxchg
; exit status: 42
section .data
    shared dq 10

section .text
    global _start

_start:
    mov rax, 10                ; expected
    mov rbx, 42                ; new value
    lock cmpxchg [shared], rbx ; succeeds, [shared] = 42
    mov rdi, [shared]
    mov rax, 60
    syscall
