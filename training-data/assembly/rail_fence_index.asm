; x86-64 NASM: which rail does position i land on? (3 rails, i = 7 -> rail 1)
section .text
    global _start

_start:
    mov eax, 7              ; i
    mov ecx, 4              ; period = 2 * (rails - 1)
    xor edx, edx
    div ecx                 ; edx = i mod period
    mov eax, edx
    cmp eax, 3              ; rails
    jl .done
    mov eax, 4
    sub eax, edx            ; period - m
.done:
    mov edi, eax
    mov eax, 60
    syscall
