; x86-64 NASM: Moser-de Bruijn value for n = 11 (binary 1011 read in base 4 = 69).
; Expected: 69 -> exit code 69
section .text
    global _start

_start:
    mov rcx, 11             ; n
    xor rax, rax            ; result
    mov rbx, 1              ; place value (powers of 4)
.loop:
    test rcx, rcx
    jz .done
    test rcx, 1
    jz .skip
    add rax, rbx
.skip:
    shr rcx, 1
    shl rbx, 2
    jmp .loop
.done:
    mov rdi, rax
    mov rax, 60
    syscall
