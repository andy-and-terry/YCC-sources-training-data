; x86-64 NASM: 128-bit subtraction using sub + sbb (borrow propagation)
; (2^64 + 5) - 10 = 2^64 - 5 -> low = 0xFFFFFFFFFFFFFFFB, high = 0
; exit status: 0 if the result is correct, 1 otherwise
section .text
    global _start

_start:
    mov rax, 5                 ; low  qword of minuend
    mov rdx, 1                 ; high qword of minuend
    mov rcx, 10                ; low  qword of subtrahend
    xor rbx, rbx               ; high qword of subtrahend
    sub rax, rcx               ; low part, sets borrow (CF)
    sbb rdx, rbx               ; high part minus borrow
    mov rcx, -5                ; expected low
    cmp rax, rcx
    jne .fail
    test rdx, rdx
    jnz .fail
    xor rdi, rdi
    jmp .exit
.fail:
    mov rdi, 1
.exit:
    mov rax, 60
    syscall
