; x86-64 NASM: leap year test (divisible by 4, not by 100 unless by 400)
section .text
    global _start

_start:
    mov eax, 2024
    xor edx, edx
    mov ecx, 400
    div ecx
    test edx, edx
    jz leap
    mov eax, 2024
    xor edx, edx
    mov ecx, 100
    div ecx
    test edx, edx
    jz not_leap
    mov eax, 2024
    and eax, 3
    jnz not_leap
leap:
    mov rdi, 1
    jmp done
not_leap:
    xor rdi, rdi
done:
    mov rax, 60
    syscall
