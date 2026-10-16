; x86-64 NASM: sum odd numbers from 1 to 10 using test on bit 0
; exit status: 25
section .text
    global _start

_start:
    xor rdi, rdi
    mov rcx, 1
.loop:
    test rcx, 1
    jz .skip
    add rdi, rcx
.skip:
    inc rcx
    cmp rcx, 10
    jle .loop
    mov rax, 60
    syscall
