; x86-64 NASM: sum a dword array
global _start
section .data
arr:    dd 3, 5, 7, 9, 11
len     equ ($ - arr) / 4
section .text
_start:
    xor eax, eax
    xor ecx, ecx
.next:
    cmp ecx, len
    jge .done
    add eax, [arr + rcx*4]
    inc ecx
    jmp .next
.done:
    mov edi, eax       ; 35
    mov eax, 60
    syscall
