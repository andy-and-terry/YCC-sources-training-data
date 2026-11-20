; x86-64 NASM: smallest prime p such that p and 28-p are both prime (Goldbach)
; exit status: 5
section .text
    global _start

; is_prime: rdi = n, returns rax = 1 if prime else 0
is_prime:
    cmp rdi, 2
    jl .no
    mov rcx, 2
.next:
    mov rax, rcx
    mul rax
    cmp rax, rdi
    ja .yes
    mov rax, rdi
    xor rdx, rdx
    div rcx
    test rdx, rdx
    jz .no
    inc rcx
    jmp .next
.yes:
    mov rax, 1
    ret
.no:
    xor rax, rax
    ret

_start:
    mov rbx, 2
.try:
    mov rdi, rbx
    call is_prime
    test rax, rax
    jz .skip
    mov rdi, 28
    sub rdi, rbx
    call is_prime
    test rax, rax
    jnz .found
.skip:
    inc rbx
    jmp .try
.found:
    mov rdi, rbx
    mov rax, 60
    syscall
