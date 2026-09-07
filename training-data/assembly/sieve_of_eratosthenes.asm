; x86-64 NASM: count primes up to N using the sieve of Eratosthenes
section .bss
    sieve resb 30

section .text
    global _start

_start:
    lea rdi, [sieve]
    xor rcx, rcx
clear_loop:
    cmp rcx, 30
    jge clear_done
    mov byte [rdi + rcx], 1
    inc rcx
    jmp clear_loop
clear_done:
    mov byte [rdi], 0
    mov byte [rdi + 1], 0

    mov rsi, 2               ; p = 2
mark_outer:
    mov rax, rsi
    imul rax, rsi
    cmp rax, 30
    jge count_primes
    cmp byte [rdi + rsi], 0
    je mark_next_p
    mov rdx, rax             ; multiple = p*p
mark_inner:
    cmp rdx, 30
    jge mark_next_p
    mov byte [rdi + rdx], 0
    add rdx, rsi
    jmp mark_inner
mark_next_p:
    inc rsi
    jmp mark_outer

count_primes:
    xor rbx, rbx              ; count = 0
    xor rcx, rcx
count_loop:
    cmp rcx, 30
    jge count_done
    cmp byte [rdi + rcx], 0
    je count_next
    inc rbx
count_next:
    inc rcx
    jmp count_loop
count_done:
    mov rdi, rbx
    mov rax, 60
    syscall
