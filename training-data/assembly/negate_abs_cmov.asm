global iabs
section .text
iabs:                   ; edi -> eax = |edi|
    mov     eax, edi
    neg     eax
    cmovl   eax, edi
    ret
