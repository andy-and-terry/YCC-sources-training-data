; x86-64 NASM: is 13 an emirp? reverse is 31 (prime and different) -> exit 1
section .text
    global _start

is_prime:                   ; edi = n, returns eax = 1/0
    cmp edi, 2
    jl .no
    mov ecx, 2
.loop:
    mov eax, ecx
    imul eax, ecx
    cmp eax, edi
    jg .yes
    mov eax, edi
    xor edx, edx
    div ecx
    test edx, edx
    jz .no
    inc ecx
    jmp .loop
.yes:
    mov eax, 1
    ret
.no:
    xor eax, eax
    ret

_start:
    mov edi, 13
    call is_prime
    mov r8d, eax
    mov edi, 31             ; digits of 13 reversed
    call is_prime
    and eax, r8d
    mov edi, eax
    mov eax, 60
    syscall
