; x86-64 NASM: integer square root via binary search
section .text
    global _start

_start:
    mov r8, 50           ; n
    xor r9, r9            ; low
    mov r10, r8            ; high
    mov rdi, 0             ; result
sqrt_loop:
    cmp r9, r10
    jg done
    mov rax, r9
    add rax, r10
    xor rdx, rdx
    mov rcx, 2
    div rcx                ; mid = (low+high)/2
    mov r11, rax
    mov rax, r11
    imul rax, r11
    cmp rax, r8
    jg go_lower
    mov rdi, r11
    mov r9, r11
    inc r9
    jmp sqrt_loop
go_lower:
    mov r10, r11
    dec r10
    jmp sqrt_loop
done:
    mov rax, 60
    syscall
