; x86-64 NASM: count primes below 30 by trial division
; exit status: 10
section .text
    global _start

_start:
    xor r8, r8                 ; count
    mov r9, 2                  ; candidate
.candidate:
    cmp r9, 30
    jge .done
    mov r10, 2                 ; divisor
.trial:
    mov rax, r10
    imul rax, r10
    cmp rax, r9
    jg .prime
    mov rax, r9
    xor rdx, rdx
    div r10
    test rdx, rdx
    jz .next
    inc r10
    jmp .trial
.prime:
    inc r8
.next:
    inc r9
    jmp .candidate
.done:
    mov rdi, r8
    mov rax, 60
    syscall
