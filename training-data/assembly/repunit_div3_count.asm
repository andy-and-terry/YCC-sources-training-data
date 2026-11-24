; x86-64 NASM: count repunits R_1..R_8 divisible by 3 (111 and 111111).
; Expected: 2 -> exit code 2
section .text
    global _start

_start:
    xor r12, r12            ; count
    xor r8, r8              ; R
    mov r9, 8
.loop:
    imul r8, r8, 10
    inc r8
    mov rax, r8
    xor rdx, rdx
    mov rcx, 3
    div rcx
    test rdx, rdx
    jnz .skip
    inc r12
.skip:
    dec r9
    jnz .loop
    mov rdi, r12
    mov rax, 60
    syscall
