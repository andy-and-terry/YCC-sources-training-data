; x86-64 NASM: lucky numbers up to 50 by deleting every k-th survivor
section .bss
    terms resq 32
    numbuf resb 24

section .text
    global _start

_start:
    xor r8, r8              ; n = number of survivors
    mov rax, 1
lucky_fill:
    mov [terms + r8*8], rax
    inc r8
    add rax, 2
    cmp rax, 50
    jle lucky_fill
    mov r9, 1               ; index of the current step
lucky_sieve:
    cmp r9, r8
    jge lucky_done
    mov r10, [terms + r9*8] ; step
    cmp r10, r8
    jg lucky_done
    xor r13, r13            ; kept count
    xor r12, r12            ; j (0-based)
lucky_scan:
    lea rax, [r12 + 1]
    xor edx, edx
    div r10
    test rdx, rdx
    jz lucky_skip           ; (j+1) divisible by step -> delete
    mov rax, [terms + r12*8]
    mov [terms + r13*8], rax
    inc r13
lucky_skip:
    inc r12
    cmp r12, r8
    jl lucky_scan
    mov r8, r13
    inc r9
    jmp lucky_sieve
lucky_done:
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
