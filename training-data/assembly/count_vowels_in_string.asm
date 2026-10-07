; x86-64 NASM: count vowels (a, e, i, o, u) in a null-terminated string
section .data
    text db "the quick brown fox", 0

section .text
    global _start

_start:
    lea rsi, [text]
    xor rbx, rbx            ; vowel count
scan_loop:
    mov al, [rsi]
    cmp al, 0
    je done
    cmp al, 'a'
    je is_vowel
    cmp al, 'e'
    je is_vowel
    cmp al, 'i'
    je is_vowel
    cmp al, 'o'
    je is_vowel
    cmp al, 'u'
    je is_vowel
    jmp next_char
is_vowel:
    inc rbx
next_char:
    inc rsi
    jmp scan_loop
done:
    mov rdi, rbx
    mov rax, 60
    syscall
