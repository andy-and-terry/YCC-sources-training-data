; x86-64 NASM: digital root of 9875 (9+8+7+5=29 -> 2+9=11 -> 1+1=2)
section .text
    global _start

_start:
    mov eax, 9875
    mov ebx, 10
root_outer:
    cmp eax, 10
    jb finished
    xor ecx, ecx
sum_digits:
    xor edx, edx
    div ebx
    add ecx, edx
    test eax, eax
    jnz sum_digits
    mov eax, ecx
    jmp root_outer
finished:
    mov edi, eax
    mov rax, 60
    syscall
