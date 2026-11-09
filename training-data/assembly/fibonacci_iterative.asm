global fib
section .text
fib:                    ; edi = n -> rax
    xor     eax, eax
    mov     ecx, 1
.l:
    test    edi, edi
    jz      .done
    lea     edx, [rax + rcx]
    mov     eax, ecx
    mov     ecx, edx
    dec     edi
    jmp     .l
.done:
    ret
