; x86-64 NASM: recursive exponentiation by squaring
; exit status: 243
section .text
    global _start

; rdi = base, rsi = exponent -> rax
power:
    test rsi, rsi
    jnz .recurse
    mov rax, 1
    ret
.recurse:
    push rdi
    push rsi
    shr rsi, 1
    call power                 ; rax = base^(exp/2)
    imul rax, rax
    pop rsi
    pop rdi
    test rsi, 1
    jz .even
    imul rax, rdi
.even:
    ret

_start:
    mov rdi, 3
    mov rsi, 5
    call power                 ; 3^5 = 243
    mov rdi, rax
    mov rax, 60
    syscall
