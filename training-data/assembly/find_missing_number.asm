; x86-64 NASM: find the missing number in 0..n given an array of n
; distinct values from that range, via the sum formula
section .data
    array dq 0, 1, 3, 4, 5
    count equ 5             ; n = count, range is 0..count inclusive

section .text
    global _start

_start:
    mov rax, count
    inc rax
    imul rax, count          ; n * (n + 1)
    shr rax, 1                ; expected sum = n * (n + 1) / 2

    xor rbx, rbx
    xor rcx, rcx
sum_loop:
    cmp rcx, count
    jge done
    add rbx, [array + rcx * 8]
    inc rcx
    jmp sum_loop
done:
    sub rax, rbx              ; missing = expected - actual (2)
    mov rdi, rax
    mov rax, 60
    syscall
