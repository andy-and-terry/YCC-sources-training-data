; x86-64 NASM: Hamming distance of two integers via XOR and popcount loop
section .text
    global _start

_start:
    mov eax, 0b101101
    mov ebx, 0b011001
    xor eax, ebx
    xor edi, edi
pop_loop:
    test eax, eax
    jz done
    lea edx, [eax - 1]
    and eax, edx       ; clear lowest set bit
    inc edi
    jmp pop_loop
done:
    mov rax, 60        ; exit status = number of differing bits (3)
    syscall
