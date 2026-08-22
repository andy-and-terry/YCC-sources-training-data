; x86-64 NASM: reverse an array in place
section .data
    array dq 1, 2, 3, 4, 5
    count equ 5

section .text
    global _start

_start:
    xor rsi, rsi
    mov rdi, count - 1
reverse_loop:
    cmp rsi, rdi
    jge done
    mov rax, [array + rsi * 8]
    mov rbx, [array + rdi * 8]
    mov [array + rsi * 8], rbx
    mov [array + rdi * 8], rax
    inc rsi
    dec rdi
    jmp reverse_loop
done:
    mov rax, [array]
    mov rdi, rax
    mov rax, 60
    syscall
