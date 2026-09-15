; x86-64 NASM: check whether two lowercase strings are anagrams of each other
section .data
    str1 db "listen", 0
    str2 db "silent", 0

section .bss
    counts resb 26

section .text
    global _start

_start:
    ; zero out the counts array
    lea rdi, [counts]
    xor rax, rax
    mov rcx, 26
clear_loop:
    mov byte [rdi], 0
    inc rdi
    loop clear_loop

    ; increment counts for each letter in str1
    lea rsi, [str1]
    lea rdi, [counts]
count_str1:
    movzx rax, byte [rsi]
    cmp al, 0
    je decrement_str2
    sub al, 'a'
    inc byte [rdi + rax]
    inc rsi
    jmp count_str1

    ; decrement counts for each letter in str2
decrement_str2:
    lea rsi, [str2]
decrement_loop:
    movzx rax, byte [rsi]
    cmp al, 0
    je check_result
    sub al, 'a'
    dec byte [rdi + rax]
    inc rsi
    jmp decrement_loop

check_result:
    ; every count should be back to zero if the strings are anagrams
    lea rsi, [counts]
    xor rcx, rcx
verify_loop:
    cmp rcx, 26
    jge is_anagram_true
    movsx rax, byte [rsi + rcx]
    cmp rax, 0
    jne is_anagram_false
    inc rcx
    jmp verify_loop

is_anagram_true:
    mov rdi, 1
    jmp done
is_anagram_false:
    mov rdi, 0
done:
    mov rax, 60
    syscall
