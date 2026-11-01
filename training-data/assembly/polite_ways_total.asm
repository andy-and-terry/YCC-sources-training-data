; x86-64 NASM: total number of ways, over n = 1..16, to write n as a sum of
; two or more consecutive positive integers. Expected exit code: 14
section .text
    global _start

_start:
    xor r12, r12            ; total
    mov r13, 1              ; n
.next:
    mov r14, 2              ; k
.kloop:
    lea rax, [r14 + 1]
    imul rax, r14
    shr rax, 1              ; k(k+1)/2
    cmp rax, r13
    ja .donek
    lea rax, [r14 - 1]
    imul rax, r14
    shr rax, 1              ; k(k-1)/2
    mov rbx, r13
    sub rbx, rax
    mov rax, rbx
    xor rdx, rdx
    div r14
    test rdx, rdx
    jnz .nextk
    inc r12
.nextk:
    inc r14
    jmp .kloop
.donek:
    inc r13
    cmp r13, 16
    jle .next
    mov rdi, r12
    mov rax, 60
    syscall
