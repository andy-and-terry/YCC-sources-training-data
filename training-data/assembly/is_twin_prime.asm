; x86-64 NASM: are 11 and 13 both prime? (trial division)
; exit status: 1 if twin primes
section .text
    global _start

is_prime:               ; rdi = n, returns rax = 1/0
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
    mov rdi, 11
    call is_prime
    mov rbx, rax
    mov rdi, 13
    call is_prime
    and rbx, rax
    mov rdi, rbx
    mov rax, 60
    syscall
