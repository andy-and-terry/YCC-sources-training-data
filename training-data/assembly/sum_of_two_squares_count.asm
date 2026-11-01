; x86-64 NASM: count n in 1..30 expressible as a*a + b*b (a <= b, a,b >= 0).
; Expected exit code: 15
section .text
    global _start

_start:
    xor r12, r12            ; count
    mov r13, 1              ; n
.next:
    xor r14, r14            ; a
.aloop:
    mov r15, r14            ; b = a
.bloop:
    mov rax, r14
    imul rax, rax
    mov rbx, r15
    imul rbx, rbx
    add rax, rbx
    cmp rax, r13
    je .found
    ja .nexta
    inc r15
    jmp .bloop
.nexta:
    inc r14
    cmp r14, 6
    jle .aloop
    jmp .skip
.found:
    inc r12
.skip:
    inc r13
    cmp r13, 30
    jle .next
    mov rdi, r12
    mov rax, 60
    syscall
