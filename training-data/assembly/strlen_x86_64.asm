; strlen of a NUL-terminated string (System V AMD64)
global my_strlen
section .text
my_strlen:
    xor     rax, rax
.loop:
    cmp     byte [rdi + rax], 0
    je      .done
    inc     rax
    jmp     .loop
.done:
    ret
