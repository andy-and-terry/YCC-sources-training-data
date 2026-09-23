; x86-64 NASM: binary search implemented recursively (call/ret, stack frame
; per invocation) instead of with an iterative loop
section .data
    array dq 1, 3, 5, 7, 9, 11, 13
    count equ 7
    target equ 11

section .text
    global _start

; rdi = low, rsi = high, rdx = target -> returns index in rax, or -1
bsearch:
    push rbp
    mov rbp, rsp
    mov r10, rdx                ; keep target safe across the mid computation
    cmp rdi, rsi
    jg bs_not_found

    mov rax, rdi
    add rax, rsi
    shr rax, 1                    ; mid = (low + high) / 2 (unsigned, non-negative)
    mov r11, [array + rax * 8]
    cmp r11, r10
    je bs_found
    jl bs_go_right

bs_go_left:
    mov rsi, rax
    dec rsi
    mov rdx, r10
    call bsearch
    jmp bs_return
bs_go_right:
    mov rdi, rax
    inc rdi
    mov rdx, r10
    call bsearch
    jmp bs_return

bs_found:
    jmp bs_return
bs_not_found:
    mov rax, -1
bs_return:
    mov rsp, rbp
    pop rbp
    ret

_start:
    xor rdi, rdi
    mov rsi, count
    dec rsi
    mov rdx, target
    call bsearch
    mov rdi, rax                 ; expected: index 5
    mov rax, 60
    syscall
