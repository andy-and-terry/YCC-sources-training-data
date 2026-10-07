; x86-64 NASM: naive substring search, returning the first index of
; needle within haystack (or -1 if not found)
section .data
    haystack db "hello world", 0
    haystack_len equ 11
    needle db "world", 0
    needle_len equ 5

section .text
    global _start

_start:
    xor r8, r8                    ; i = candidate start index
outer_loop:
    mov rax, haystack_len
    sub rax, needle_len
    cmp r8, rax
    jg not_found
    xor r9, r9                     ; j = position within needle
inner_loop:
    cmp r9, needle_len
    jge match_found
    mov r10, r8
    add r10, r9
    movzx rax, byte [haystack + r10]
    movzx rbx, byte [needle + r9]
    cmp rax, rbx
    jne next_start
    inc r9
    jmp inner_loop
next_start:
    inc r8
    jmp outer_loop
match_found:
    mov rdi, r8                     ; expected: index 6
    jmp finish
not_found:
    mov rdi, -1
finish:
    mov rax, 60
    syscall
