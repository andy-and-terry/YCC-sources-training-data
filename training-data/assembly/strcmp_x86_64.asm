global my_strcmp
section .text
my_strcmp:              ; rdi=a, rsi=b
.l:
    mov     al, [rdi]
    mov     dl, [rsi]
    cmp     al, dl
    jne     .diff
    test    al, al
    jz      .eq
    inc     rdi
    inc     rsi
    jmp     .l
.eq:
    xor     eax, eax
    ret
.diff:
    movzx   eax, al
    movzx   edx, dl
    sub     eax, edx
    ret
