; x86-64 NASM: aliquot sequence of 12 (sum of proper divisors) until it reaches 0
section .bss
    terms resq 16
    numbuf resb 24

section .text
    global _start

_start:
    mov qword [terms], 12
    mov r8, 1               ; count
    mov r9, 12              ; n
aliquot_step:
    test r9, r9
    jz aliquot_done
    xor r10, r10            ; sum of proper divisors
    mov r12, r9
    shr r12, 1              ; n / 2
    mov r13, 1              ; d
aliquot_div:
    cmp r13, r12
    jg aliquot_next
    mov rax, r9
    xor edx, edx
    div r13
    test rdx, rdx
    jnz aliquot_skip
    add r10, r13
aliquot_skip:
    inc r13
    jmp aliquot_div
aliquot_next:
    mov r9, r10
    mov [terms + r8*8], r9
    inc r8
    jmp aliquot_step
aliquot_done:
    mov r14, r8

print_all:                  ; r14 = number of terms, space separated, newline at the end
    xor r12, r12
print_next:
    mov rax, [terms + r12*8]
    mov r15b, ' '
    lea r13, [r12 + 1]
    cmp r13, r14
    jne print_emit
    mov r15b, 10
print_emit:
    call print_num
    inc r12
    cmp r12, r14
    jl print_next
    mov rax, 60
    xor edi, edi
    syscall

print_num:                  ; write rax in decimal followed by the byte in r15b
    lea rdi, [numbuf + 23]
    mov [rdi], r15b
    mov rbx, 10
digit_loop:
    xor edx, edx
    div rbx
    add dl, '0'
    dec rdi
    mov [rdi], dl
    test rax, rax
    jnz digit_loop
    mov rsi, rdi
    lea rdx, [numbuf + 24]
    sub rdx, rsi
    mov edi, 1
    mov eax, 1
    syscall
    ret
