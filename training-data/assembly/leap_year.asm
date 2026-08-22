; x86-64 NASM: check if a year is a leap year
section .text
    global _start

_start:
    mov rax, 2024        ; year
    mov rcx, 4
    xor rdx, rdx
    mov rbx, rax
    mov rax, rbx
    xor rdx, rdx
    div rcx
    cmp rdx, 0
    jne not_leap
    ; divisible by 4; check /100 and /400
    mov rax, rbx
    mov rcx, 100
    xor rdx, rdx
    div rcx
    cmp rdx, 0
    jne is_leap
    mov rax, rbx
    mov rcx, 400
    xor rdx, rdx
    div rcx
    cmp rdx, 0
    jne not_leap
is_leap:
    mov rdi, 1
    jmp done
not_leap:
    mov rdi, 0
done:
    mov rax, 60
    syscall
