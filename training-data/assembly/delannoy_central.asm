; x86-64 NASM: central Delannoy number D(3,3) = 63 via DP in a 4x4 table
section .bss
    d resd 16
section .text
    global _start

_start:
    lea rsi, [rel d]
    mov ecx, 16
.fill:
    mov dword [rsi + rcx * 4 - 4], 1
    loop .fill
    mov r8d, 1              ; i
.rows:
    mov r9d, 1              ; j
.cols:
    mov eax, r8d
    shl eax, 2
    add eax, r9d            ; index = i*4 + j
    mov ebx, [rsi + rax * 4 - 16]       ; d[i-1][j]
    add ebx, [rsi + rax * 4 - 4]        ; d[i][j-1]
    add ebx, [rsi + rax * 4 - 20]       ; d[i-1][j-1]
    mov [rsi + rax * 4], ebx
    inc r9d
    cmp r9d, 4
    jl .cols
    inc r8d
    cmp r8d, 4
    jl .rows
    mov edi, [rsi + 15 * 4]
    mov eax, 60
    syscall
