; x86-64 NASM: compute s(13) of Stern's diatomic sequence iteratively
; s(2n) = s(n), s(2n+1) = s(n) + s(n+1); exit status: 5
section .bss
    seq resq 16

section .text
    global _start

_start:
    mov qword [seq], 0
    mov qword [seq + 8], 1
    mov rcx, 2
.loop:
    mov rax, rcx
    shr rax, 1                  ; h = i / 2
    mov rdx, [seq + rax * 8]
    test rcx, 1
    jz .store
    add rdx, [seq + rax * 8 + 8]
.store:
    mov [seq + rcx * 8], rdx
    inc rcx
    cmp rcx, 14
    jb .loop
    mov rdi, [seq + 13 * 8]
    mov rax, 60
    syscall
