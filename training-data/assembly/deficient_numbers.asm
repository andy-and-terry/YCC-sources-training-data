; x86-64 NASM: deficient numbers below 100
; Expected result 76 is returned as the process exit code.
section .text
    global _start

_start:
    xor r12, r12            ; count
    mov r13, 1
.next:
    cmp r13, 100
    jge .done
    xor r14, r14            ; divisor sum
    mov r15, 1
.dl:
    cmp r15, r13
    jge .cmp
    mov rax, r13
    xor edx, edx
    div r15
    test rdx, rdx
    jnz .nd
    add r14, r15
.nd:
    inc r15
    jmp .dl
.cmp:
    cmp r14, r13
    jge .skip
    inc r12
.skip:
    inc r13
    jmp .next
.done:
    mov rdi, r12
    mov eax, 60
    syscall
