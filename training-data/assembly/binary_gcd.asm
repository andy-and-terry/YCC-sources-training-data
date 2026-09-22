; x86-64 NASM: binary GCD (Stein's algorithm) using shifts instead of division
section .text
    global _start

_start:
    mov r8, 48             ; a
    mov r9, 18             ; b
    xor r10, r10             ; shift count

find_common_factor_2:
    mov rax, r8
    or rax, r9
    test rax, 1
    jnz reduce_a           ; stop once either a or b is odd
    shr r8, 1
    shr r9, 1
    inc r10
    jmp find_common_factor_2

reduce_a:
    test r8, 1
    jnz reduce_b
    shr r8, 1
    jmp reduce_a

reduce_b:
    test r9, 1
    jnz stein_loop
    shr r9, 1
    jmp reduce_b

stein_loop:
    cmp r8, r9
    je stein_done
    jg swap_and_subtract
    ; r9 > r8: b -= a, then strip factors of 2 from b
    sub r9, r8
shrink_b:
    test r9, 1
    jnz stein_loop
    shr r9, 1
    jmp shrink_b

swap_and_subtract:
    sub r8, r9
shrink_a:
    test r8, 1
    jnz stein_loop
    shr r8, 1
    jmp shrink_a

stein_done:
    mov rax, r8
    mov rcx, r10
    shl rax, cl               ; gcd = common_factor * remaining value
    mov rdi, rax
    mov rax, 60
    syscall
