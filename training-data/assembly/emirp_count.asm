; x86-64 NASM: count emirps below 200 (primes whose reversal is a different prime).
; Expected: 15 -> exit code 15
section .text
    global _start

; is_prime(rdi = n) -> rax = 1/0
is_prime:
    cmp rdi, 2
    jl .no
    mov rcx, 2
.loop:
    mov rax, rcx
    imul rax, rcx
    cmp rax, rdi
    jg .yes
    mov rax, rdi
    xor rdx, rdx
    div rcx
    test rdx, rdx
    jz .no
    inc rcx
    jmp .loop
.yes:
    mov rax, 1
    ret
.no:
    xor rax, rax
    ret

; reverse_num(rdi = n) -> rax
reverse_num:
    mov rax, rdi
    xor rsi, rsi
    mov r8, 10
.next:
    test rax, rax
    jz .done
    xor rdx, rdx
    div r8
    imul rsi, 10
    add rsi, rdx
    jmp .next
.done:
    mov rax, rsi
    ret

_start:
    xor r12, r12            ; count
    mov r13, 2
.scan:
    cmp r13, 200
    jge .finish
    mov rdi, r13
    call reverse_num
    mov r14, rax            ; r = reverse(n)
    cmp r14, r13
    je .skip
    mov rdi, r13
    call is_prime
    test rax, rax
    jz .skip
    mov rdi, r14
    call is_prime
    add r12, rax
.skip:
    inc r13
    jmp .scan
.finish:
    mov rax, 60
    mov rdi, r12
    syscall
