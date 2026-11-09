global gcd
section .text
gcd:                    ; rdi=a, rsi=b
.loop:
    test    rsi, rsi
    jz      .done
    xor     rdx, rdx
    mov     rax, rdi
    div     rsi
    mov     rdi, rsi
    mov     rsi, rdx
    jmp     .loop
.done:
    mov     rax, rdi
    ret
