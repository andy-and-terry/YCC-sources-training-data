; x86-64 NASM: count contiguous subarrays of {1,1,1} whose sum is 2
; exit status: 2
section .data
    nums dd 1, 1, 1
    n    equ 3
    k    equ 2

section .text
    global _start

_start:
    xor edi, edi               ; count
    xor ecx, ecx               ; i
.outer:
    cmp ecx, n
    jae .done
    xor edx, edx               ; running sum
    mov esi, ecx               ; j
.inner:
    cmp esi, n
    jae .next_i
    add edx, [nums + rsi*4]
    cmp edx, k
    jne .skip
    inc edi
.skip:
    inc esi
    jmp .inner
.next_i:
    inc ecx
    jmp .outer
.done:
    mov eax, 60
    syscall
