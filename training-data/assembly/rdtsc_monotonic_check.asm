; x86-64 NASM: read the time-stamp counter twice around a small spin loop
; exit status: 1 if the counter advanced, 0 otherwise
section .text
    global _start

_start:
    rdtsc                   ; edx:eax = counter
    shl rdx, 32
    or rax, rdx
    mov r8, rax

    mov ecx, 1000
.spin:
    loop .spin

    rdtsc
    shl rdx, 32
    or rax, rdx
    xor edi, edi
    cmp rax, r8
    seta dil                ; 1 when second reading is larger
    mov rax, 60
    syscall
