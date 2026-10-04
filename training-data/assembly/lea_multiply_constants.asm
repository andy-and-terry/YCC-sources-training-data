; x86-64 NASM: multiply by small constants using lea instead of imul
section .text
    global _start

_start:
    mov rax, 7

    lea rbx, [rax + rax*2]     ; rbx = 7 * 3  = 21
    lea rcx, [rax + rax*4]     ; rcx = 7 * 5  = 35
    lea rdx, [rax*8]           ; rdx = 7 * 8  = 56
    lea rsi, [rax + rax*8]     ; rsi = 7 * 9  = 63
    lea rdi, [rbx + rcx]       ; rdi = 21 + 35 = 56 (lea as a three-operand add)

    ; 7 * 10 = (7*5) * 2
    lea r8, [rcx + rcx]        ; r8 = 70

    ; exit with 7*3 + 7*5 + 7*8 - 7*9 + 70 = 21 + 35 + 56 - 63 + 70 = 119
    mov rdi, rbx
    add rdi, rcx
    add rdi, rdx
    sub rdi, rsi
    add rdi, r8
    mov rax, 60
    syscall
