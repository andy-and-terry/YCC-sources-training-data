; x86-64 NASM: first 20 Kolakoski terms (alphabet 1,2), printed as text
section .bss
    terms resq 24
    numbuf resb 24

section .text
    global _start

_start:
    mov qword [terms], 1
    mov qword [terms + 8], 2
    mov qword [terms + 16], 2
    mov r8, 3               ; len
    mov r9, 2               ; index of the run length being expanded
kol_loop:
    cmp r8, 20
    jge kol_done
    mov rdx, 3
    sub rdx, [terms + r8*8 - 8] ; symbol = 3 - last
    mov rcx, [terms + r9*8]     ; run length
kol_rep:
    mov [terms + r8*8], rdx
    inc r8
    dec rcx
    jnz kol_rep
    inc r9
    jmp kol_loop
kol_done:
    mov r14, 20

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
