; x86-64 NASM: count space-separated words in a string (expects 4)
section .data
    text db "the quick  brown fox", 0

section .text
    global _start

_start:
    lea rsi, [rel text]
    xor edi, edi        ; word count
    xor edx, edx        ; in-word flag
scan:
    movzx eax, byte [rsi]
    test al, al
    jz done
    cmp al, ' '
    je space
    test edx, edx
    jnz next
    inc edi
    mov edx, 1
    jmp next
space:
    xor edx, edx
next:
    inc rsi
    jmp scan
done:
    mov rax, 60
    syscall
