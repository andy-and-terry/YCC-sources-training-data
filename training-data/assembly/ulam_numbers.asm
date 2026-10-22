; x86-64 NASM: first 15 Ulam numbers (exactly one sum of two distinct earlier terms)
section .bss
    terms resq 16
    numbuf resb 24

section .text
    global _start

_start:
    mov qword [terms], 1
    mov qword [terms + 8], 2
    mov r8, 2               ; n
    mov r9, 2               ; candidate
ulam_cand:
    cmp r8, 15
    jge ulam_done
    inc r9
    xor r10, r10            ; ways
    xor r12, r12            ; a
ulam_a:
    lea r13, [r12 + 1]      ; b > a
ulam_b:
    cmp r13, r8
    jge ulam_a_next
    mov rax, [terms + r12*8]
    add rax, [terms + r13*8]
    cmp rax, r9
    jne ulam_b_next
    inc r10
ulam_b_next:
    inc r13
    jmp ulam_b
ulam_a_next:
    inc r12
    cmp r12, r8
    jl ulam_a
    cmp r10, 1
    jne ulam_cand
    mov [terms + r8*8], r9
    inc r8
    jmp ulam_cand
ulam_done:
    mov r14, 15

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
