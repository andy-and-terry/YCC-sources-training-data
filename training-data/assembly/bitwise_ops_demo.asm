; x86-64 NASM: demonstrate AND, OR, XOR, NOT, and shift operations
section .text
    global _start

_start:
    mov rax, 0b1100          ; 12
    mov rbx, 0b1010          ; 10

    mov rcx, rax
    and rcx, rbx              ; 0b1000 = 8

    mov rdx, rax
    or rdx, rbx                ; 0b1110 = 14

    mov r8, rax
    xor r8, rbx                 ; 0b0110 = 6

    mov r9, rax
    not r9                       ; bitwise complement of 12
    and r9, 0xFF                  ; keep the low byte for a readable result

    mov r10, rax
    shl r10, 2                     ; 12 << 2 = 48

    mov r11, rax
    shr r11, 2                      ; 12 >> 2 = 3

    ; combine everything into one value to expose via the exit code
    add rcx, rdx
    add rcx, r8
    add rcx, r10
    add rcx, r11
    and rcx, 0xFF

    mov rdi, rcx
    mov rax, 60
    syscall
