; x86-64 NASM: sign vs zero extension of a byte
; exit status: 1
section .data
    byte_val db 0xF0           ; -16 as signed

section .text
    global _start

_start:
    movsx rax, byte [byte_val] ; -16
    movzx rbx, byte [byte_val] ; 240
    xor rdi, rdi
    cmp rax, 0
    jge .check_zx
    inc rdi                    ; signed value is negative
.check_zx:
    cmp rbx, 240
    je .done
    mov rdi, 99
.done:
    mov rax, 60
    syscall
