global swap32
section .text
swap32:                 ; edi -> eax byte-swapped
    mov     eax, edi
    bswap   eax
    ret
