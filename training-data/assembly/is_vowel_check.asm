; x86-64 NASM: check whether a character is a vowel
section .text
    global _start

_start:
    mov al, 'e'
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
    mov rdi, 0
    jmp done
is_vowel:
    mov rdi, 1
done:
    mov rax, 60
    syscall
