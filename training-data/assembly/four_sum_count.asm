; x86-64 NASM: count tuples (a,b,c,d) summing to zero; exit status = 2
section .data
a:      dd 1, 2
b:      dd -2, -1
c:      dd -1, 2
d:      dd 0, 2

section .text
    global _start

_start:
    xor r8d, r8d            ; count
    xor eax, eax            ; i
loop_i:
    xor ebx, ebx            ; j
loop_j:
    xor ecx, ecx            ; k
loop_k:
    xor edx, edx            ; l
loop_l:
    mov esi, [a + rax*4]
    add esi, [b + rbx*4]
    add esi, [c + rcx*4]
    add esi, [d + rdx*4]
    jnz skip
    inc r8d
skip:
    inc edx
    cmp edx, 2
    jl loop_l
    inc ecx
    cmp ecx, 2
    jl loop_k
    inc ebx
    cmp ebx, 2
    jl loop_j
    inc eax
    cmp eax, 2
    jl loop_i
    mov edi, r8d
    mov eax, 60
    syscall
