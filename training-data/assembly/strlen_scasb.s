.intel_syntax noprefix
.globl my_strlen
my_strlen:
    mov rsi, rdi
    xor eax, eax
    mov rcx, -1
    repne scasb
    not rcx
    dec rcx
    mov rax, rcx
    ret
