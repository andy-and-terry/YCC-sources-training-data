; x86-64 NASM: add 0b1010 and 0b1011 with ripple-carry logic; exit status = 21
section .text
    global _start

_start:
    mov eax, 0b1010         ; a
    mov ebx, 0b1011         ; b
ripple:
    test ebx, ebx
    jz done
    mov ecx, eax
    and ecx, ebx            ; carry bits
    shl ecx, 1
    xor eax, ebx            ; sum without carries
    mov ebx, ecx
    jmp ripple
done:
    mov edi, eax
    mov eax, 60
    syscall
