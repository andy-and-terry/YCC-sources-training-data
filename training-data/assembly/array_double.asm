; x86-64 NASM: double every element of an array in place
section .data
    array dq 1, 2, 3, 4, 5
    count equ 5

section .text
    global _start

_start:
    xor rcx, rcx
double_loop:
    cmp rcx, count
    jge done
    mov rax, [array + rcx * 8]
    shl rax, 1
    mov [array + rcx * 8], rax
    inc rcx
    jmp double_loop
done:
    mov rdi, [array]
    mov rax, 60
    syscall
