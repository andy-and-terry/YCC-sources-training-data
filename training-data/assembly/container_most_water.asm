; x86-64 NASM: container with most water; exit status = best area (49)
section .data
h:      dd 1, 8, 6, 2, 5, 4, 8, 3, 7
n       equ 9

section .text
    global _start

_start:
    xor esi, esi            ; lo
    mov edi, n - 1          ; hi
    xor r8d, r8d            ; best
loop_top:
    cmp esi, edi
    jge finish
    mov eax, [h + rsi*4]    ; a
    mov edx, [h + rdi*4]    ; b
    mov ecx, eax
    cmp edx, ecx
    cmovl ecx, edx          ; ecx = min(a, b)
    mov r9d, edi
    sub r9d, esi            ; width
    imul ecx, r9d           ; area
    cmp ecx, r8d
    cmovg r8d, ecx
    cmp eax, edx
    jl move_lo
    dec edi
    jmp loop_top
move_lo:
    inc esi
    jmp loop_top
finish:
    mov edi, r8d
    mov eax, 60
    syscall
