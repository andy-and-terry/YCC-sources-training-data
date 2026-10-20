.intel_syntax noprefix
.globl main
main:
    mov eax, 7
    mov ebx, 9
    xchg eax, ebx
    mov eax, ebx   # eax = 7
    ret
