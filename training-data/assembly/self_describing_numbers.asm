; x86-64 NASM: is the digit string "2020" self-describing? exit 1 if yes
section .data
    digits db 2, 0, 2, 0
    len equ 4

section .text
    global _start

_start:
    xor rsi, rsi        ; i = position / digit value being counted
position_loop:
    cmp rsi, len
    jae yes
    xor rcx, rcx        ; j
    xor r8, r8          ; count of digit i
count_loop:
    cmp rcx, len
    jae compare
    movzx rax, byte [digits + rcx]
    cmp rax, rsi
    jne skip
    inc r8
skip:
    inc rcx
    jmp count_loop
compare:
    movzx rax, byte [digits + rsi]
    cmp rax, r8
    jne no
    inc rsi
    jmp position_loop
yes:
    mov rdi, 1
    jmp exit
no:
    xor rdi, rdi
exit:
    mov rax, 60
    syscall
