.intel_syntax noprefix
.globl main
main:
    xor eax, eax
    mov ecx, 10
1:  add eax, ecx
    dec ecx
    jnz 1b
    ret          # returns 55
