; x86-64 NASM: is 97 prime? returns 1 for prime
; exit status: 1
section .text
    global _start

_start:
    mov rbx, 97
    mov rcx, 2
check:
    mov rax, rcx
    mul rcx
    cmp rax, rbx
    ja prime
    mov rax, rbx
    xor rdx, rdx
    div rcx
    test rdx, rdx
    jz composite
    inc rcx
    jmp check
prime:
    mov rdi, 1
    jmp exit
composite:
    xor rdi, rdi
exit:
    mov rax, 60
    syscall
