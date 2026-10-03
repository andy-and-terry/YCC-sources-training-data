; x86-64 NASM: build an in-place prefix-sum array
section .data
    array dq 3, 1, 4, 1, 5, 9
    count equ 6

section .text
    global _start

_start:
    mov rcx, 1
prefix_loop:
    cmp rcx, count
    jge done
    mov rax, [array + rcx * 8]
    add rax, [array + rcx * 8 - 8]
    mov [array + rcx * 8], rax
    inc rcx
    jmp prefix_loop
done:
    mov rax, [array + (count - 1) * 8]   ; total sum = 23
    mov rdi, rax
    mov rax, 60
    syscall
