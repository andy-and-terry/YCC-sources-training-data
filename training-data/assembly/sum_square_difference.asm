; x86-64 NASM (Linux): Square of the sum minus sum of squares for 1..10 (expect 2640)
; Exit status is the difference modulo 256 (2640 & 0xFF = 80).
section .text
    global _start

_start:
    xor rbx, rbx               ; sum
    xor rsi, rsi               ; sum of squares
    mov rcx, 1
.next:
    add rbx, rcx
    mov rax, rcx
    imul rax, rcx
    add rsi, rax
    inc rcx
    cmp rcx, 10
    jle .next
    imul rbx, rbx
    sub rbx, rsi
    mov rdi, rbx
    mov rax, 60
    syscall
