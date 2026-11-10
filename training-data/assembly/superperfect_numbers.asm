; x86-64 NASM: count superperfect numbers below 100 (sigma(sigma(n)) = 2n: 2, 4, 16, 64) -> exit code 4
section .text
    global _start

sigma:                   ; rdi = n, returns rax = sum of divisors
    xor rsi, rsi
    mov rcx, 1
.loop:
    cmp rcx, rdi
    jg .done
    mov rax, rdi
    xor rdx, rdx
    div rcx
    test rdx, rdx
    jnz .next
    add rsi, rcx
.next:
    inc rcx
    jmp .loop
.done:
    mov rax, rsi
    ret

_start:
    xor r12, r12
    mov r13, 1
.scan:
    cmp r13, 100
    jge .done
    mov rdi, r13
    call sigma
    mov rdi, rax
    call sigma
    lea rbx, [r13*2]
    cmp rax, rbx
    jne .next
    inc r12
.next:
    inc r13
    jmp .scan
.done:
    mov rdi, r12
    mov rax, 60
    syscall
