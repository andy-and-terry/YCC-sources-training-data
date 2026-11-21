; x86-64 NASM: count Disarium numbers below 1000 (digits raised to their
; 1-based positions sum to n). Expected: 14 -> exit code 14
section .text
    global _start

; disarium_sum(rdi = n) -> rax = sum of digit^position
disarium_sum:
    ; k = number of digits
    mov r8, rdi
    xor rcx, rcx
    mov r10, 10
.count:
    test r8, r8
    jz .counted
    mov rax, r8
    xor rdx, rdx
    div r10
    mov r8, rax
    inc rcx
    jmp .count
.counted:
    mov r8, rdi             ; m
    xor r9, r9              ; sum
.digit:
    test r8, r8
    jz .done
    mov rax, r8
    xor rdx, rdx
    div r10
    mov r8, rax             ; m /= 10
    ; rdx = digit, rcx = position; compute rdx^rcx
    mov r11, 1
    mov rsi, rcx
.pow:
    imul r11, rdx
    dec rsi
    jnz .pow
    add r9, r11
    dec rcx                 ; next digit has the previous position
    jmp .digit
.done:
    mov rax, r9
    ret

_start:
    xor r12, r12
    mov r13, 1
.next:
    cmp r13, 1000
    jge .finish
    mov rdi, r13
    call disarium_sum
    cmp rax, r13
    jne .advance
    inc r12
.advance:
    inc r13
    jmp .next
.finish:
    mov rax, 60
    mov rdi, r12
    syscall
