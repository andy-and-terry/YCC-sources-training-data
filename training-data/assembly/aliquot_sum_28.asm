; x86-64 NASM: aliquot (proper divisor) sum of 28 is 28 -> perfect number
; exit status: 28
section .text
    global _start

_start:
    mov r8, 28                 ; n
    xor r9, r9                 ; sum
    mov rcx, 1                 ; d
.loop:
    cmp rcx, r8
    jae .done
    mov rax, r8
    xor rdx, rdx
    div rcx
    test rdx, rdx
    jnz .next
    add r9, rcx
.next:
    inc rcx
    jmp .loop
.done:
    mov rdi, r9
    mov rax, 60
    syscall
