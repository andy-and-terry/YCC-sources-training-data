; x86-64 NASM: check whether a string is a palindrome
section .data
    msg db "racecar", 0

section .text
    global _start

_start:
    lea rsi, [msg]
    lea rdi, [msg]
find_end:
    cmp byte [rdi], 0
    je found_end
    inc rdi
    jmp find_end
found_end:
    dec rdi

check_loop:
    cmp rsi, rdi
    jge is_palindrome
    mov al, [rsi]
    mov bl, [rdi]
    cmp al, bl
    jne not_palindrome
    inc rsi
    dec rdi
    jmp check_loop
is_palindrome:
    mov rdi, 1
    jmp exit
not_palindrome:
    mov rdi, 0
exit:
    mov rax, 60
    syscall
