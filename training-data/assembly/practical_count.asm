; x86-64 NASM: count practical numbers in [1, 40] using a subset-sum bitmask.
; Expected: 15 (1 2 4 6 8 12 16 18 20 24 28 30 32 36 40) -> exit code 15
section .text
    global _start

; is_practical(rdi = n) -> rax = 1/0
is_practical:
    mov r8, 1               ; reach: bit i set <=> i is a subset sum
    mov rcx, 1              ; d
.divs:
    cmp rcx, rdi
    jg .check
    mov rax, rdi
    xor rdx, rdx
    div rcx
    test rdx, rdx
    jnz .next_d
    mov rax, r8
    shl rax, cl
    or r8, rax
.next_d:
    inc rcx
    jmp .divs
.check:
    mov rcx, rdi
    inc rcx
    mov rax, 1
    shl rax, cl
    dec rax                 ; mask = 2^(n+1) - 1
    and r8, rax
    xor rdx, rdx
    cmp r8, rax
    sete dl
    mov rax, rdx
    ret

_start:
    xor r12, r12
    mov r13, 1
.scan:
    cmp r13, 40
    jg .finish
    mov rdi, r13
    call is_practical
    add r12, rax
    inc r13
    jmp .scan
.finish:
    mov rax, 60
    mov rdi, r12
    syscall
