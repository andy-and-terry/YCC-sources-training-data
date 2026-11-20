; x86-64 NASM: count twin prime pairs below 50 by trial division
; exit status: 6
section .text
    global _start

is_prime:                      ; rdi = n -> rax
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
    xor r12, r12               ; count
    mov rbx, 3
.loop:
    mov rdi, rbx
    call is_prime
    test rax, rax
    jz .skip
    lea rdi, [rbx + 2]
    call is_prime
    add r12, rax
.skip:
    inc rbx
    cmp rbx, 48
    jbe .loop
    mov rdi, r12
    mov rax, 60
    syscall
