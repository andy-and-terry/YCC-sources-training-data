; x86-64 NASM: integer square root via binary search (isqrt(1000000) = 1000)
section .text
    global _start

_start:
    mov rdi, 1000000     ; n
    xor rsi, rsi         ; lo = 0
    mov rdx, 1000001     ; hi = n + 1 (exclusive)
search:
    lea rax, [rsi + 1]
    cmp rax, rdx
    jae done             ; while lo + 1 < hi
    lea rcx, [rsi + rdx]
    shr rcx, 1           ; mid
    mov rax, rcx
    imul rax, rcx        ; mid * mid
    cmp rax, rdi
    ja too_big
    mov rsi, rcx         ; lo = mid
    jmp search
too_big:
    mov rdx, rcx         ; hi = mid
    jmp search
done:
    mov rdi, rsi         ; result in rsi
    shr rdi, 3           ; scale for exit code (125)
    mov rax, 60
    syscall
