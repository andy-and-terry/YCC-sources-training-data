; x86-64 NASM: check whether a string of parentheses is balanced using a stack
section .data
    str db "(()(()))", 0

section .bss
    stack resb 64

section .text
    global _start

_start:
    lea rsi, [str]
    lea rbx, [stack]
    xor r8, r8                 ; stack pointer / current depth
check_loop:
    mov al, [rsi]
    test al, al
    jz check_done
    cmp al, '('
    jne check_close
    mov [rbx + r8], al
    inc r8
    jmp check_next
check_close:
    cmp al, ')'
    jne check_next
    test r8, r8
    jz unbalanced
    dec r8
check_next:
    inc rsi
    jmp check_loop
check_done:
    test r8, r8
    jnz unbalanced
    mov rdi, 1                  ; balanced
    jmp exit_prog
unbalanced:
    mov rdi, 0
exit_prog:
    mov rax, 60
    syscall
