; x86-64 NASM (Linux): print the first 15 Tribonacci numbers
; T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
section .bss
    buf resb 24

section .text
    global _start

_start:
    xor r12, r12            ; a = T(n)
    xor r13, r13            ; b = T(n+1)
    mov r14, 1              ; c = T(n+2)
    mov r15, 15             ; terms left

next_term:
    mov rax, r12
    call print_num
    lea rax, [r12 + r13]
    add rax, r14            ; next = a + b + c
    mov r12, r13
    mov r13, r14
    mov r14, rax
    dec r15
    jnz next_term

    mov rax, 60             ; exit(0)
    xor rdi, rdi
    syscall

; print_num: write rax in decimal followed by a newline
print_num:
    lea rdi, [buf + 23]
    mov byte [rdi], 10
    mov rcx, 10
.digit:
    xor rdx, rdx
    div rcx
    add dl, '0'
    dec rdi
    mov [rdi], dl
    test rax, rax
    jnz .digit
    mov rsi, rdi
    lea rdx, [buf + 24]
    sub rdx, rsi
    mov rax, 1              ; write(1, rsi, rdx)
    mov rdi, 1
    syscall
    ret
