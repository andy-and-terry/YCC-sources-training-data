; x86-64 NASM: rcl shifts the carry flag into the low bit
; exit status: 3
section .text
    global _start

_start:
    mov al, 0x81               ; 1000 0001
    stc                        ; CF = 1
    rcl al, 1                  ; 0000 0011, CF = 1
    movzx rdi, al
    mov rax, 60
    syscall
