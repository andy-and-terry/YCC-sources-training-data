; x86-64 NASM: detect signed overflow with jo
; exit status: 1
section .text
    global _start

_start:
    mov al, 100
    add al, 100                ; 200 does not fit in int8, OF = 1
    jo .overflow
    xor rdi, rdi
    jmp .done
.overflow:
    mov rdi, 1
.done:
    mov rax, 60
    syscall
