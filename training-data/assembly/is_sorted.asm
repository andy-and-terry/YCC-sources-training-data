; x86-64 NASM: check whether an array is non-decreasing (exit 1 if sorted)
section .data
    arr dd 1, 3, 3, 8, 12
    len equ 5

section .text
    global _start

_start:
    lea rsi, [rel arr]
    mov ecx, 1
check:
    cmp ecx, len
    jge sorted
    mov eax, [rsi + rcx*4 - 4]
    cmp eax, [rsi + rcx*4]
    jg not_sorted
    inc ecx
    jmp check
sorted:
    mov edi, 1
    jmp done
not_sorted:
    xor edi, edi
done:
    mov eax, 60
    syscall
