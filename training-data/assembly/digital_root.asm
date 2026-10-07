; x86-64 NASM: digital root by repeated digit sums (9875 -> 2)
section .text
    global _start

_start:
    mov eax, 9875
    mov ebx, 10
root_loop:
    cmp eax, 10
    jb  finished
    xor ecx, ecx
sum_digits:
    xor edx, edx
    div ebx
    add ecx, edx
    test eax, eax
    jnz sum_digits
    mov eax, ecx
    jmp root_loop
finished:
    mov edi, eax
    mov eax, 60
    syscall
