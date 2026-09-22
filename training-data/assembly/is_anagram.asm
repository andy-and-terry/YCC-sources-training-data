; x86-64 NASM: check whether two lowercase strings are anagrams of each other
section .data
    str1 db "listen", 0
    str2 db "silent", 0

section .bss
    counts resq 26

section .text
    global _start

_start:
    lea rdi, [counts]
    mov rcx, 26
clear_loop:
    mov qword [rdi], 0
    add rdi, 8
    loop clear_loop

    lea rsi, [str1]
add_loop:
    mov al, [rsi]
    test al, al
    jz sub_start
    sub al, 'a'
    movzx rax, al
    inc qword [counts + rax * 8]
    inc rsi
    jmp add_loop

sub_start:
    lea rsi, [str2]
sub_loop:
    mov al, [rsi]
    test al, al
    jz check_start
    sub al, 'a'
    movzx rax, al
    dec qword [counts + rax * 8]
    inc rsi
    jmp sub_loop

check_start:
    xor rcx, rcx             ; index
    mov rdi, 1                ; assume anagram
check_loop:
    cmp rcx, 26
    jge exit
    mov rax, [counts + rcx * 8]
    test rax, rax
    jz check_next
    mov rdi, 0                 ; found a nonzero count, not an anagram
    jmp exit
check_next:
    inc rcx
    jmp check_loop
exit:
    mov rax, 60
    syscall
