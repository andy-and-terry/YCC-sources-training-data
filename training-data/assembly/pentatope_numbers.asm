; x86-64 NASM (Linux): print pentatope_numbers, one per line
; n(n+1)(n+2)(n+3)/24
section .bss
    buf resb 24

section .text
    global _start

_start:
    mov r12, 1              ; n
next:
    push r12
    push r12
    push 1
    pop rbx
    pop rax
    add rax, rbx
    push rax
    pop rbx
    pop rax
    imul rax, rbx
    push rax
    push r12
    push 2
    pop rbx
    pop rax
    add rax, rbx
    push rax
    pop rbx
    pop rax
    imul rax, rbx
    push rax
    push r12
    push 3
    pop rbx
    pop rax
    add rax, rbx
    push rax
    pop rbx
    pop rax
    imul rax, rbx
    push rax
    push 24
    pop rbx
    pop rax
    xor rdx, rdx
    div rbx
    push rax
    pop rax
    call print_num
    inc r12
    cmp r12, 15
    jle next
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
