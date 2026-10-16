; x86-64 NASM: count letter 'a' in a string using scasb
; exit status: 3
section .data
    text db "banana", 0
    len equ $ - text - 1

section .text
    global _start

_start:
    cld
    lea rdi, [text]
    mov rcx, len
    xor rbx, rbx
    mov al, 'a'
.scan:
    jrcxz .done
    repne scasb
    jne .done
    inc rbx
    jmp .scan
.done:
    mov rdi, rbx
    mov rax, 60
    syscall
