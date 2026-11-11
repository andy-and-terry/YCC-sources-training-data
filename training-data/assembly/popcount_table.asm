; x86-64 NASM (Linux): Population count (number of set bits) for 0..15
; Builds the 16-entry popcount table using the POPCNT instruction.
section .bss
    table resb 16

section .text
    global _start

_start:
    xor rcx, rcx
.next:
    popcnt rax, rcx
    mov [table + rcx], al
    inc rcx
    cmp rcx, 16
    jl .next
    movzx rdi, byte [table + 15]   ; popcount(15) = 4
    mov rax, 60
    syscall
