; x86-64 NASM: jrcxz skips a loop body when the element count is zero
; exit status: 10 (change count to 0 and the status becomes 0)
section .data
    values dd 1, 2, 3, 4
    count  equ 4

section .text
    global _start

_start:
    lea rsi, [rel values]
    mov ecx, count
    xor eax, eax
    jrcxz .done         ; "loop" would wrap around if rcx started at 0
.next:
    add eax, [rsi]
    add rsi, 4
    loop .next
.done:
    mov edi, eax
    mov rax, 60
    syscall
