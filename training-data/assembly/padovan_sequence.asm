; x86-64 NASM (Linux): print the first 15 Padovan numbers
; P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
section .bss
    buf resb 24

section .text
    global _start

_start:
    mov r12, 1              ; a = P(n)
    mov r13, 1              ; b = P(n+1)
    mov r14, 1              ; c = P(n+2)
    mov r15, 15             ; terms left
next:
    mov rax, r12
    call print_num
    lea rax, [r12 + r13]    ; P(n+3) = P(n) + P(n+1)
    mov r12, r13
    mov r13, r14
    mov r14, rax
    dec r15
    jnz next
    mov rax, 60             ; exit(0)
    xor edi, edi
    syscall

; print rax in decimal followed by a space
print_num:
    lea rsi, [buf + 23]
    mov byte [rsi], ' '
    mov rcx, 10
conv:
    xor edx, edx
    div rcx
    add dl, '0'
    dec rsi
    mov [rsi], dl
    test rax, rax
    jnz conv
    lea rdx, [buf + 24]
    sub rdx, rsi            ; length
    mov rax, 1              ; write
    mov edi, 1
    syscall
    ret
