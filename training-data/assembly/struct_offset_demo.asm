; x86-64 NASM: access fields of a struct-like record via named byte offsets
; instead of magic numbers, the way a C struct's members would be addressed
section .data
    X_OFFSET equ 0
    Y_OFFSET equ 8
    point1   dq 3, 4        ; x = 3 (offset 0), y = 4 (offset 8)

section .text
    global _start

_start:
    mov rax, [point1 + X_OFFSET]
    mov rbx, [point1 + Y_OFFSET]
    add rax, rbx             ; 3 + 4 = 7
    mov rdi, rax
    mov rax, 60
    syscall
