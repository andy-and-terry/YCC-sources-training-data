; x86-64 NASM: check whether 153 is an Armstrong number (3-digit)
section .text
    global _start

_start:
    mov rax, 153
    mov rbx, rax          ; keep original
    xor r8, r8             ; sum of cubes
digit_loop:
    cmp rax, 0
    je check
    xor rdx, rdx
    mov rcx, 10
    div rcx
    mov r9, rdx
    mov r10, rdx
    imul r10, r9
    imul r10, r9
    add r8, r10
    jmp digit_loop
check:
    cmp r8, rbx
    je is_armstrong
    mov rdi, 0
    jmp done
is_armstrong:
    mov rdi, 1
done:
    mov rax, 60
    syscall
