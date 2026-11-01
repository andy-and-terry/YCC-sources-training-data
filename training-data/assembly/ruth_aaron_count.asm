; x86-64 NASM: count Ruth-Aaron pairs (n, n+1) with 2 <= n < 110, where the
; sums of prime factors (with multiplicity) agree. Expected exit code: 4
section .text
    global _start

; sopfr(rdi = n) -> rax
sopfr:
    xor rax, rax            ; total
    mov rcx, 2              ; p
.outer:
    mov r8, rcx
    imul r8, r8
    cmp r8, rdi
    ja .tail
.inner:
    mov r9, rax
    mov rax, rdi
    xor rdx, rdx
    div rcx
    test rdx, rdx
    mov rax, r9
    jnz .nextp
    add rax, rcx
    mov r9, rax
    mov rax, rdi
    xor rdx, rdx
    div rcx
    mov rdi, rax
    mov rax, r9
    jmp .inner
.nextp:
    inc rcx
    jmp .outer
.tail:
    cmp rdi, 1
    jbe .ret
    add rax, rdi
.ret:
    ret

_start:
    xor r12, r12            ; count
    mov r13, 2              ; n
.next:
    mov rdi, r13
    call sopfr
    mov r14, rax
    lea rdi, [r13 + 1]
    call sopfr
    cmp rax, r14
    jne .skip
    inc r12
.skip:
    inc r13
    cmp r13, 109
    jbe .next
    mov rdi, r12
    mov rax, 60
    syscall
