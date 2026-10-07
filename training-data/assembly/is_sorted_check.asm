; x86-64 NASM: check whether an array is sorted in ascending order
section .data
    array dq 1, 2, 2, 5, 9
    count equ 5

section .text
    global _start

_start:
    lea rsi, [array]
    mov rcx, 1
.loop:
    cmp rcx, count
    jge .sorted
    mov rax, [rsi + rcx*8 - 8]
    cmp rax, [rsi + rcx*8]
    jg .unsorted
    inc rcx
    jmp .loop
.sorted:
    mov rdi, 1
    jmp .exit
.unsorted:
    xor rdi, rdi
.exit:
    mov rax, 60
    syscall
