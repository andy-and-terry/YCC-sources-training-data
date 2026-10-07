; x86-64 NASM: ternary search over a sorted array, splitting the range
; into three parts each iteration instead of two
section .data
    array dq 2, 4, 6, 8, 10, 12, 14, 16, 18
    count equ 9
    target equ 14

section .text
    global _start

_start:
    xor rbx, rbx               ; low
    mov r9, count - 1           ; high

search_loop:
    cmp rbx, r9
    jg not_found
    mov rax, r9
    sub rax, rbx
    mov rcx, 3
    cdq
    idiv rcx                    ; rax = (high - low) / 3
    mov r10, rbx
    add r10, rax                 ; mid1 = low + (high - low) / 3
    mov r11, r9
    sub r11, rax                 ; mid2 = high - (high - low) / 3

    mov rsi, [array + r10 * 8]
    cmp rsi, target
    je found1
    mov rdx, [array + r11 * 8]
    cmp rdx, target
    je found2

    cmp target, rsi
    jl take_left
    cmp target, rdx
    jg take_right

    mov rbx, r10
    inc rbx
    mov r9, r11
    dec r9
    jmp search_loop
take_left:
    mov r9, r10
    dec r9
    jmp search_loop
take_right:
    mov rbx, r11
    inc rbx
    jmp search_loop

found1:
    mov rdi, r10
    jmp exit
found2:
    mov rdi, r11
    jmp exit
not_found:
    mov rdi, -1
exit:
    mov rax, 60
    syscall
