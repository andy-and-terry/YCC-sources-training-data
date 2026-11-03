; x86-64 NASM: is 49 a perfect square? exit 1 if yes, 0 if no
; exit status: 1
section .text
    global _start

_start:
    mov r8, 49
    xor rdi, rdi
    xor rcx, rcx
.loop:
    mov rax, rcx
    imul rax, rcx
    cmp rax, r8
    je .yes
    jg .done
    inc rcx
    jmp .loop
.yes:
    mov rdi, 1
.done:
    mov rax, 60
    syscall
