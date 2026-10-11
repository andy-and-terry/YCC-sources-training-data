; x86-64 NASM: character classification using a single unsigned compare
; exit status: 1
section .text
    global _start

_start:
    mov al, '7'
    sub al, '0'
    cmp al, 9
    setbe dil                  ; unsigned <= 9 means digit
    movzx rdi, dil
    mov rax, 60
    syscall
