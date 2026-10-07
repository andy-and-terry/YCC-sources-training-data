; x86-64 NASM: in-place prefix sums of an array; exit with the last element
section .data
    arr dd 1, 2, 3, 4, 5
    len equ 5

section .text
    global _start

_start:
    lea rsi, [rel arr]
    mov ecx, 1
loop_top:
    cmp ecx, len
    jge done
    mov eax, [rsi + rcx*4 - 4]
    add [rsi + rcx*4], eax
    inc ecx
    jmp loop_top
done:
    mov edi, [rsi + (len-1)*4]   ; 15
    mov eax, 60
    syscall
