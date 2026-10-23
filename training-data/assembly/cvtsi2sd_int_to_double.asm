; x86-64 NASM: convert integers to doubles with SSE2, compute an average
section .data
    values  dq 7, 12, 5, 20
    count   equ 4

section .text
    global _start

_start:
    xorpd xmm0, xmm0            ; running sum = 0.0
    lea rsi, [rel values]
    mov rcx, count

.loop:
    cvtsi2sd xmm1, qword [rsi]  ; int64 -> double
    addsd xmm0, xmm1
    add rsi, 8
    dec rcx
    jnz .loop

    mov rax, count
    cvtsi2sd xmm2, rax
    divsd xmm0, xmm2            ; xmm0 = 44 / 4 = 11.0

    cvttsd2si rdi, xmm0         ; truncate back to integer
    mov rax, 60
    syscall                     ; exit(11)
