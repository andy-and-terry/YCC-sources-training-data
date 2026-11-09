global my_memcpy
section .text
my_memcpy:              ; rdi=dst, rsi=src, rdx=n
    mov     rax, rdi
    mov     rcx, rdx
    rep movsb
    ret
