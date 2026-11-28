; x86-64 NASM: is 19 a happy number? (loop digit-square-sum, max 20 iterations)
; exit status: 1 if happy, 0 otherwise (expected: 1)
section .text
    global _start

_start:
    mov r8, 19                  ; candidate
    mov r9, 20                  ; iteration cap (unhappy numbers cycle)
.next:
    cmp r8, 1
    je .happy
    dec r9
    jz .unhappy
    xor rcx, rcx                ; sum
    mov rax, r8
.digit:
    xor rdx, rdx
    mov rbx, 10
    div rbx                     ; rax = quotient, rdx = digit
    imul rdx, rdx
    add rcx, rdx
    test rax, rax
    jnz .digit
    mov r8, rcx
    jmp .next
.happy:
    mov rdi, 1
    jmp .exit
.unhappy:
    xor rdi, rdi
.exit:
    mov rax, 60
    syscall
