; x86-64 NASM: find the maximum value in an array
section .data
    array dq 5, 3, 8, 1, 9, 2
    count equ 6

section .text
    global _start

_start:
    mov rax, [array]      ; max = array[0]
    xor rcx, rcx          ; index = 0
max_loop:
    cmp rcx, count
    jge max_done
    mov rdx, [array + rcx * 8]
    cmp rdx, rax
    jle max_skip
    mov rax, rdx
max_skip:
    inc rcx
    jmp max_loop
max_done:
    ; rax now holds the max (9); exit with it as status code
    mov rdi, rax
    mov rax, 60
    syscall
