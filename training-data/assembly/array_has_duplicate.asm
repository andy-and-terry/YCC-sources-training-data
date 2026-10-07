; x86-64 NASM: detect whether an array contains any repeated value
; using a naive O(n^2) pairwise comparison
section .data
    array dq 4, 2, 7, 9, 2, 5
    count equ 6

section .text
    global _start

_start:
    xor r8, r8              ; found = 0
    xor rcx, rcx
outer_loop:
    cmp rcx, count
    jge done
    mov rax, [array + rcx * 8]
    mov rdx, rcx
    inc rdx
inner_loop:
    cmp rdx, count
    jge outer_next
    cmp rax, [array + rdx * 8]
    jne inner_next
    mov r8, 1
    jmp done
inner_next:
    inc rdx
    jmp inner_loop
outer_next:
    inc rcx
    jmp outer_loop
done:
    mov rdi, r8
    mov rax, 60
    syscall
