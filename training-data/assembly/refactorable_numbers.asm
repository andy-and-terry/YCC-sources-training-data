; x86-64 NASM: tau(36) = 9 divisors, and 36 mod 9 == 0 so 36 is refactorable -> exit code 9
section .text
    global _start

_start:
    mov rsi, 36
    xor rbx, rbx         ; divisor count
    mov rcx, 1
.loop:
    cmp rcx, rsi
    jg .done
    mov rax, rsi
    xor rdx, rdx
    div rcx
    test rdx, rdx
    jnz .next
    inc rbx
.next:
    inc rcx
    jmp .loop
.done:
    mov rdi, rbx
    mov rax, 60
    syscall
