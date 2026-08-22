; x86-64 NASM: compute the product of all elements in an array
section .data
    array dq 1, 2, 3, 4, 5
    count equ 5

section .text
    global _start

_start:
    mov rax, 1
    xor rcx, rcx
product_loop:
    cmp rcx, count
    jge done
    imul rax, [array + rcx * 8]
    inc rcx
    jmp product_loop
done:
    mov rdi, rax
    mov rax, 60
    syscall
