; x86-64 NASM: number of Roman numeral symbols needed for 1994 (MCMXCIV) using
; a greedy table of values and symbol lengths
; exit status: 7
section .data
    values  dw 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1
    lengths db    1,   2,   1,   2,   1,  2,  1,  2,  1, 2, 1, 2, 1

section .text
    global _start

_start:
    mov eax, 1994              ; remaining value
    xor edi, edi               ; symbol count
    xor ecx, ecx               ; table index
.next_entry:
    cmp ecx, 13
    jae .done
    movzx edx, word [values + rcx*2]
.repeat:
    cmp eax, edx
    jb .advance
    sub eax, edx
    movzx esi, byte [lengths + rcx]
    add edi, esi
    jmp .repeat
.advance:
    inc ecx
    jmp .next_entry
.done:
    mov eax, 60
    syscall
