; x86-64 NASM: lucky numbers below 100, exit with how many there are (23)
section .bss
    nums resb 64

section .text
    global _start

_start:
    xor r8, r8              ; len
    mov eax, 1
lucky_init:
    cmp eax, 99
    jg lucky_sieve
    mov [nums + r8], al     ; odd numbers 1, 3, ..., 99
    inc r8
    add eax, 2
    jmp lucky_init
lucky_sieve:
    mov r9, 1               ; idx of the next survivor (0-based)
lucky_pass:
    cmp r9, r8
    jge lucky_done
    movzx ecx, byte [nums + r9] ; k
    cmp rcx, r8
    jg lucky_done           ; k larger than list -> finished
    xor r10, r10            ; kept = 0
    xor rsi, rsi            ; p = 0 (position p + 1 is deleted if divisible by k)
lucky_scan:
    cmp rsi, r8
    jge lucky_pass_end
    lea rax, [rsi + 1]
    xor edx, edx
    div rcx                 ; rdx = (p + 1) mod k
    test rdx, rdx
    jz lucky_skip
    mov al, [nums + rsi]
    mov [nums + r10], al
    inc r10
lucky_skip:
    inc rsi
    jmp lucky_scan
lucky_pass_end:
    mov r8, r10
    inc r9
    jmp lucky_pass
lucky_done:
    mov rdi, r8             ; exit with the count of lucky numbers
    mov rax, 60
    syscall
