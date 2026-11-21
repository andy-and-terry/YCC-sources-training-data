; x86-64 NASM: count Carmichael numbers below 3000 via Korselt's criterion:
; composite, squarefree, and p - 1 divides n - 1 for every prime factor p.
; Expected: 5 (561 1105 1729 2465 2821) -> exit code 5
section .text
    global _start

; is_carmichael(rdi = n) -> rax = 1/0
is_carmichael:
    mov r8, rdi             ; m
    mov r9, 2               ; p
    xor r10, r10            ; prime factor count
.scan:
    mov rax, r9
    imul rax, r9
    cmp rax, r8
    jg .leftover
    mov rax, r8
    xor rdx, rdx
    div r9
    test rdx, rdx
    jnz .next_p
    mov r8, rax             ; m /= p
    ; squarefree check: p must not divide the new m
    mov rax, r8
    xor rdx, rdx
    div r9
    test rdx, rdx
    jz .no
    ; (n - 1) mod (p - 1) must be 0
    lea rax, [rdi - 1]
    lea rcx, [r9 - 1]
    xor rdx, rdx
    div rcx
    test rdx, rdx
    jnz .no
    inc r10
.next_p:
    inc r9
    jmp .scan
.leftover:
    cmp r8, 1
    jle .final
    lea rax, [rdi - 1]
    lea rcx, [r8 - 1]
    xor rdx, rdx
    div rcx
    test rdx, rdx
    jnz .no
    inc r10
.final:
    xor rax, rax
    cmp r10, 2
    setge al
    ret
.no:
    xor rax, rax
    ret

_start:
    xor r12, r12
    mov r13, 3
.next:
    cmp r13, 3000
    jge .finish
    mov rdi, r13
    call is_carmichael
    add r12, rax
    add r13, 2
    jmp .next
.finish:
    mov rax, 60
    mov rdi, r12
    syscall
