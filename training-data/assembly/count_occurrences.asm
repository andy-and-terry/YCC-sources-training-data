; x86-64 NASM: count occurrences of a value in an array
section .data
    array dq 5, 3, 5, 1, 5, 2
    count equ 6
    target dq 5

section .text
    global _start

_start:
    xor rax, rax          ; occurrences
    xor rcx, rcx
    mov r8, [target]
count_loop:
    cmp rcx, count
    jge done
    mov rdx, [array + rcx * 8]
    cmp rdx, r8
    jne skip
    inc rax
skip:
    inc rcx
    jmp count_loop
done:
    mov rdi, rax
    mov rax, 60
    syscall
