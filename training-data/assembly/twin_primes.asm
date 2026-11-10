; x86-64 NASM: count twin-prime pairs (p, p+2) with p+2 <= 80 -> exit code 8
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
    xor r12, r12         ; pair count
    mov r13, 3           ; p
.scan:
    cmp r13, 78
    jg .done
    mov rdi, r13
    call is_prime
    test rax, rax
    jz .next
    lea rdi, [r13 + 2]
    call is_prime
    add r12, rax
.next:
    inc r13
    jmp .scan
.done:
    mov rdi, r12
    mov rax, 60
    syscall
