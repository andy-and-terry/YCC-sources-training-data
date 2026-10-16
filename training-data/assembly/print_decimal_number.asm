; x86-64 NASM: convert a number to ASCII digits and print it
; exit status: 0
section .bss
    buf resb 20

section .text
    global _start

_start:
    mov rax, 12345
    lea rdi, [buf + 19]
    mov byte [rdi], 10         ; newline at the end
    mov rbx, 10
.digit:
    xor rdx, rdx
    div rbx
    add dl, '0'
    dec rdi
    mov [rdi], dl
    test rax, rax
    jnz .digit
    lea rdx, [buf + 20]
    sub rdx, rdi               ; length
    mov rsi, rdi
    mov rdi, 1
    mov rax, 1
    syscall
    mov rax, 60
    xor rdi, rdi
    syscall
