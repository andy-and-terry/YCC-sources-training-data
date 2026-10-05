; x86-64 NASM: index of first occurrence of a character using repne scasb
section .data
    text db "assembly", 0
    len equ $ - text - 1

section .text
    global _start

_start:
    lea rdi, [rel text]
    mov al, 'm'
    mov ecx, len
    cld
    repne scasb
    jne not_found
    lea rax, [rel text]
    sub rdi, rax
    dec rdi            ; rdi is one past the match
    jmp done
not_found:
    mov rdi, 255
done:
    mov rax, 60        ; exit status = 4
    syscall
