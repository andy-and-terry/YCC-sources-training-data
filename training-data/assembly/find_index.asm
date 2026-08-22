; x86-64 NASM: find the index of a target value in an array
section .data
    array dq 5, 3, 8, 1, 9, 2
    count equ 6
    target dq 1

section .text
    global _start

_start:
    xor rcx, rcx
    mov r8, [target]
search_loop:
    cmp rcx, count
    jge not_found
    mov rdx, [array + rcx * 8]
    cmp rdx, r8
    je found
    inc rcx
    jmp search_loop
found:
    mov rdi, rcx
    jmp done
not_found:
    mov rdi, -1
done:
    mov rax, 60
    syscall
