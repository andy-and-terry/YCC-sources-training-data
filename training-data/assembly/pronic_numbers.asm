; x86-64 NASM: is 56 pronic (7 * 8)? scan n until n*(n+1) >= x
; exit status: 1 if pronic (expected: 1)
section .text
    global _start

_start:
    mov r8, 56                  ; x
    xor rcx, rcx                ; n
.loop:
    mov rax, rcx
    inc rax
    imul rax, rcx               ; n * (n + 1)
    cmp rax, r8
    jae .done
    inc rcx
    jmp .loop
.done:
    xor rdi, rdi
    cmp rax, r8
    sete dil
    mov rax, 60
    syscall
