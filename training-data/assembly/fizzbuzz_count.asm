; x86-64 NASM: count numbers in 1..30 divisible by 3 or 5 (expects 14)
section .text
    global _start

_start:
    mov ecx, 1
    xor esi, esi
loop_top:
    mov eax, ecx
    xor edx, edx
    mov ebx, 3
    div ebx
    test edx, edx
    jz hit
    mov eax, ecx
    xor edx, edx
    mov ebx, 5
    div ebx
    test edx, edx
    jnz miss
hit:
    inc esi
miss:
    inc ecx
    cmp ecx, 30
    jle loop_top
    mov edi, esi
    mov rax, 60
    syscall
