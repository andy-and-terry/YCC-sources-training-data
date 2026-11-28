; x86-64 NASM: rail index of position 5 in a 3-rail zigzag (cycle 4)
; exit status: 1
section .text
    global _start

_start:
    mov rax, 5
    xor rdx, rdx
    mov rcx, 4          ; cycle = 2*(k-1)
    div rcx             ; rdx = 5 mod 4 = 1
    mov rdi, rdx
    cmp rdi, 3          ; k = 3
    jb .ok
    mov rax, 4
    sub rax, rdi
    mov rdi, rax
.ok:
    mov rax, 60
    syscall
