; x86-64 NASM: check whether a number equals the sum of its proper
; divisors (28 = 1 + 2 + 4 + 7 + 14 -> perfect)
section .text
    global _start

_start:
    mov rax, 28
    xor rbx, rbx           ; sum of divisors
    mov rcx, 1
divisor_loop:
    cmp rcx, rax
    jge check_done
    mov rdx, rax
    push rax
    push rcx
    mov rax, rdx
    xor rdx, rdx
    div rcx
    pop rcx
    pop rax
    cmp rdx, 0
    jne not_divisor
    add rbx, rcx
not_divisor:
    inc rcx
    jmp divisor_loop
check_done:
    xor rdi, rdi
    cmp rbx, rax
    jne not_perfect
    mov rdi, 1              ; exit 1 = perfect
not_perfect:
    mov rax, 60
    syscall
