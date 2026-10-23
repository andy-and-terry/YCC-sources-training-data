; x86-64 NASM: two's complement identity: -x == (~x) + 1
; exit status: 0 if neg and not+inc agree for x = 42, otherwise 1
section .text
    global _start

_start:
    mov rax, 42
    mov rbx, 42
    neg rax                    ; rax = -42
    not rbx                    ; rbx = ~42
    inc rbx                    ; rbx = ~42 + 1
    xor rdi, rdi
    cmp rax, rbx
    je .exit
    mov rdi, 1
.exit:
    mov rax, 60
    syscall
