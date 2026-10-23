; x86-64 NASM (Linux): print the first 15 Pell numbers, one per line
section .bss
    buf resb 24

section .text
    global _start

_start:
    xor r12, r12            ; P(n-2) = 0
    mov r13, 1              ; P(n-1) = 1
    mov r14, 15             ; terms left
next:
    mov rax, r12
    call print_num
    lea rax, [r13*2 + r12]  ; P(n) = 2*P(n-1) + P(n-2)
    mov r12, r13
    mov r13, rax
    dec r14
    jnz next
    mov rax, 60
    xor rdi, rdi
    syscall

; print rax in decimal followed by a newline
print_num:
    lea rsi, [buf + 23]
    mov byte [rsi], 10
    mov rcx, 10
.digit:
    xor rdx, rdx
    div rcx
    add dl, '0'
    dec rsi
    mov [rsi], dl
    test rax, rax
    jnz .digit
    lea rdx, [buf + 24]
    sub rdx, rsi
    mov rdi, 1
    mov rax, 1
    syscall
    ret
