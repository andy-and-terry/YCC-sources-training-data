; x86-64 NASM: count bulls (same digit in same position) for "1807" vs "7810"
; exit status: 1
section .data
    secret db "1807"
    guess  db "7810"

section .text
    global _start

_start:
    xor rdi, rdi               ; bulls
    xor rcx, rcx
.loop:
    mov al, [secret + rcx]
    cmp al, [guess + rcx]
    jne .next
    inc rdi
.next:
    inc rcx
    cmp rcx, 4
    jb .loop
    mov rax, 60
    syscall
