; x86-64 NASM: count Munchausen numbers below 5000 (digit^digit sum equals n,
; with 0^0 counted as 0). Expected: 2 (1 and 3435) -> exit code 2
section .text
    global _start

; dpow(rdi = d) -> rax = d^d (0 for d == 0)
dpow:
    test rdi, rdi
    jnz .go
    xor rax, rax
    ret
.go:
    mov rax, 1
    mov rcx, rdi
.loop:
    imul rax, rdi
    dec rcx
    jnz .loop
    ret

; is_munchausen(rdi = n) -> rax = 1/0
is_munchausen:
    mov r8, rdi             ; m
    xor r9, r9              ; sum
    mov r10, 10
.digit:
    test r8, r8
    jz .done
    mov rax, r8
    xor rdx, rdx
    div r10
    mov r8, rax
    mov rdi, rdx            ; digit
    push r8
    push r9
    call dpow
    pop r9
    pop r8
    add r9, rax
    jmp .digit
.done:
    ; return the digit^digit sum; the caller compares it with n
    mov rax, r9
    ret

_start:
    xor r12, r12            ; count
    mov r13, 1
.next:
    cmp r13, 5000
    jge .finish
    mov rdi, r13
    call is_munchausen
    cmp rax, r13
    jne .advance
    inc r12
.advance:
    inc r13
    jmp .next
.finish:
    mov rax, 60
    mov rdi, r12
    syscall
