; x86-64 NASM: XOR-fold {4,1,2,1,2} to find the unpaired value; exit status = 4
section .data
nums:   dd 4, 1, 2, 1, 2
count   equ 5

section .text
    global _start

_start:
    xor edi, edi
    xor ecx, ecx
fold:
    xor edi, [nums + rcx*4]
    inc ecx
    cmp ecx, count
    jl fold
    mov eax, 60
    syscall
