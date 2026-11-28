; x86-64 NASM: minimum path through a 4-row triangle; exit status = 11
section .data
tri:    dd 2, 0, 0, 0
        dd 3, 4, 0, 0
        dd 6, 5, 7, 0
        dd 4, 1, 8, 3
dp:     dd 4, 1, 8, 3       ; starts as the bottom row

section .text
    global _start

_start:
    mov r8d, 2              ; r = 2 .. 0
row_loop:
    xor ecx, ecx            ; i
col_loop:
    mov eax, [dp + rcx*4]
    mov edx, [dp + rcx*4 + 4]
    cmp edx, eax
    cmovl eax, edx          ; min(dp[i], dp[i+1])
    mov r9d, r8d
    shl r9d, 2
    add r9d, ecx            ; index r*4 + i
    add eax, [tri + r9*4]
    mov [dp + rcx*4], eax
    inc ecx
    cmp ecx, r8d
    jle col_loop
    dec r8d
    jns row_loop
    mov edi, [dp]
    mov eax, 60
    syscall
