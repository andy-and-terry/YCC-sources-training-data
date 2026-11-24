; x86-64 NASM: count fibbinary numbers (no two adjacent 1 bits) below 50.
; Expected: 21 -> exit code 21
section .text
    global _start

_start:
    xor r12, r12
    xor r8, r8              ; n
.loop:
    cmp r8, 50
    jge .done
    mov rax, r8
    shr rax, 1
    and rax, r8
    jnz .skip
    inc r12
.skip:
    inc r8
    jmp .loop
.done:
    mov rdi, r12
    mov rax, 60
    syscall
