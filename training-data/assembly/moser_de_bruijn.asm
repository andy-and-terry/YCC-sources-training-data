; x86-64 NASM: Moser-de Bruijn value of i = 9 (binary 1001 read in base 4) -> exit code 65
section .text
    global _start

_start:
    mov rcx, 9           ; i
    xor rbx, rbx         ; value
    mov rdx, 1           ; power of 4
.loop:
    test rcx, rcx
    jz .done
    test rcx, 1
    jz .skip
    add rbx, rdx
.skip:
    shl rdx, 2
    shr rcx, 1
    jmp .loop
.done:
    mov rdi, rbx
    mov rax, 60
    syscall
