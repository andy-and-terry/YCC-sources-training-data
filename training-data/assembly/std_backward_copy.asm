; x86-64 NASM: overlapping copy toward higher addresses using std + rep movsb
; Setting the direction flag copies backward, so overlap is handled safely.
; buffer "abcdef" shifted right by 2 inside itself -> "ababcd"
; prints: ababcd
section .data
    buf db "abcdef", 10
section .text
    global _start

_start:
    lea rsi, [buf + 3]         ; last source byte
    lea rdi, [buf + 5]         ; last destination byte
    mov rcx, 4
    std                        ; direction flag: decrement rsi/rdi
    rep movsb
    cld                        ; always restore the flag
    mov rax, 1
    mov rdi, 1
    lea rsi, [buf]
    mov rdx, 7
    syscall
    mov rax, 60
    xor rdi, rdi
    syscall
