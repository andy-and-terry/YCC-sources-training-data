; x86-64 NASM: count Sophie Germain primes below 100 (p and 2p + 1 both prime).
; Expected: 10 (2 3 5 11 23 29 41 53 83 89) -> exit code 10
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

_start:
    xor r12, r12
    mov r13, 2
.scan:
    cmp r13, 100
    jge .finish
    mov rdi, r13
    call is_prime
    test rax, rax
    jz .skip
    lea rdi, [r13*2 + 1]
    call is_prime
    add r12, rax
.skip:
    inc r13
    jmp .scan
.finish:
    mov rax, 60
    mov rdi, r12
    syscall
