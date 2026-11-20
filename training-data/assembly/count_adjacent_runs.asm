; x86-64 NASM: count runs of equal bytes in "aabbbcdd" (dedupe length)
; exit status: 4
section .data
    s db "aabbbcdd"
    len equ $ - s

section .text
    global _start

_start:
    mov rdi, 1                 ; first byte starts a run
    mov rcx, 1
.loop:
    cmp rcx, len
    jae .done
    mov al, [s + rcx]
    cmp al, [s + rcx - 1]
    je .same
    inc rdi
.same:
    inc rcx
    jmp .loop
.done:
    mov rax, 60
    syscall
