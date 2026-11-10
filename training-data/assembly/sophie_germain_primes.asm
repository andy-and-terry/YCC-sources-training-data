; x86-64 NASM: count Sophie Germain primes below 100 (p and 2p+1 both prime) -> exit code 10
section .text
    global _start

is_prime:                ; rdi = n, returns rax = 1 if prime
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
    jge .done
    mov rdi, r13
    call is_prime
    test rax, rax
    jz .next
    lea rdi, [r13*2 + 1]
    call is_prime
    add r12, rax
.next:
    inc r13
    jmp .scan
.done:
    mov rdi, r12
    mov rax, 60
    syscall
