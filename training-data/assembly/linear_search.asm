; x86-64 NASM: linear search for a target value in an unsorted array
section .data
    array dq 5, 3, 8, 1, 9, 2
    count equ 6
    target dq 9

section .text
    global _start

_start:
    xor rcx, rcx              ; index = 0
    mov r10, [target]

search_loop:
    cmp rcx, count
    jge not_found
    mov rax, [array + rcx * 8]
    cmp rax, r10
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
