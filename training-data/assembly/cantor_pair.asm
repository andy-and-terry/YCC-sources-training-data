; x86-64 NASM: Cantor pairing function pair(x, y) = (x+y)(x+y+1)/2 + y.
; pair(3, 4) = 7 * 8 / 2 + 4 = 32 -> exit code 32
section .text
    global _start

; pair(rdi = x, rsi = y) -> rax
pair:
    lea rax, [rdi + rsi]    ; s = x + y
    lea rcx, [rax + 1]
    imul rax, rcx           ; s * (s + 1)
    shr rax, 1              ; / 2
    add rax, rsi            ; + y
    ret

_start:
    mov rdi, 3
    mov rsi, 4
    call pair
    mov rdi, rax
    mov rax, 60
    syscall
