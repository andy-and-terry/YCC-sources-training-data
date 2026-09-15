; x86-64 NASM: find the indices of two numbers in an array that sum to a target
section .data
    array dq 2, 7, 11, 15
    count equ 4
    target dq 9

section .text
    global _start

_start:
    mov r10, [target]
    xor r8, r8                 ; i = 0
outer_loop:
    cmp r8, count
    jge not_found
    mov rax, r8
    inc rax
    mov r9, rax                 ; j = i + 1
inner_loop:
    cmp r9, count
    jge next_i
    mov rax, [array + r8 * 8]
    add rax, [array + r9 * 8]
    cmp rax, r10
    je found
    inc r9
    jmp inner_loop
next_i:
    inc r8
    jmp outer_loop
found:
    ; encode the pair of indices as i * 10 + j in the exit code
    mov rax, r8
    imul rax, 10
    add rax, r9
    mov rdi, rax
    jmp exit
not_found:
    mov rdi, -1
exit:
    mov rax, 60
    syscall
