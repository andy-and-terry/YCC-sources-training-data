; x86-64 NASM: extended Euclidean algorithm computing gcd(a,b) and Bezout coefficients
section .text
    global _start

_start:
    mov r12, 240             ; old_r = a
    mov r13, 46               ; r = b
    mov r8, 1                  ; old_s = 1
    mov r9, 0                   ; s = 0
    mov r10, 0                    ; old_t = 0
    mov r11, 1                     ; t = 1

ext_gcd_loop:
    cmp r13, 0
    je ext_gcd_done

    mov rax, r12
    xor rdx, rdx
    div r13                   ; rax = quotient, rdx = old_r mod r
    mov r14, rax                ; quotient

    mov r15, r13                 ; save current r
    mov r13, rdx                   ; r = remainder
    mov r12, r15                     ; old_r = previous r

    mov rax, r14
    imul rax, r9
    mov rbx, r8
    sub rbx, rax
    mov r8, r9
    mov r9, rbx

    mov rax, r14
    imul rax, r11
    mov rbx, r10
    sub rbx, rax
    mov r10, r11
    mov r11, rbx

    jmp ext_gcd_loop

ext_gcd_done:
    ; r12 = gcd(a, b); r8 = x, r10 = y such that a*x + b*y = gcd
    mov rdi, r12
    mov rax, 60
    syscall
