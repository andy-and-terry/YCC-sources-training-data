; x86-64 NASM: central Delannoy numbers D(0..9), D(m,n) = D(m-1,n) + D(m,n-1) + D(m-1,n-1)
section .bss
    grid  resq 100
    terms resq 10
    numbuf resb 24

section .text
    global _start

_start:
    xor r8, r8              ; m
delannoy_row:
    xor r9, r9              ; n
delannoy_cell:
    mov rax, 1
    test r8, r8
    jz delannoy_store
    test r9, r9
    jz delannoy_store
    imul r10, r8, 10
    add r10, r9
    mov rax, [grid + r10*8 - 80]    ; D(m-1,n)
    add rax, [grid + r10*8 - 8]     ; D(m,n-1)
    add rax, [grid + r10*8 - 88]    ; D(m-1,n-1)
delannoy_store:
    imul r10, r8, 10
    add r10, r9
    mov [grid + r10*8], rax
    inc r9
    cmp r9, 10
    jl delannoy_cell
    imul r10, r8, 11
    mov rax, [grid + r10*8]         ; D(m,m)
    mov [terms + r8*8], rax
    inc r8
    cmp r8, 10
    jl delannoy_row
    mov r14, 10

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
