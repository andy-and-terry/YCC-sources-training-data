; x86-64 NASM: first Goldbach split of 28 - find smallest prime p with 28-p prime
; exit status: 5
section .text
    global _start

is_prime:               ; rdi = n -> rax 1/0
    cmp rdi, 2
    jb .no
    mov rcx, 2
.l:
    mov rax, rcx
    mul rcx
    cmp rax, rdi
    ja .yes
    mov rax, rdi
    xor rdx, rdx
    div rcx
    test rdx, rdx
    jz .no
    inc rcx
    jmp .l
.yes:
    mov rax, 1
    ret
.no:
    xor rax, rax
    ret

_start:
    mov r12, 2
.try:
    mov rdi, r12
    call is_prime
    test rax, rax
    jz .next
    mov rdi, 28
    sub rdi, r12
    call is_prime
    test rax, rax
    jnz .found
.next:
    inc r12
    jmp .try
.found:
    mov rdi, r12
    mov rax, 60
    syscall
