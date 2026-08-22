; x86-64 NASM: find the max value using recursion
section .data
    array dq 5, 3, 8, 1, 9, 2
    count equ 6

section .text
    global _start

find_max:
    ; rdi = pointer, rsi = count -> rax = max
    cmp rsi, 1
    jg recurse
    mov rax, [rdi]
    ret
recurse:
    push rdi
    push rsi
    dec rsi
    call find_max
    pop rsi
    pop rdi
    mov rbx, [rdi + rsi * 8 - 8]
    cmp rbx, rax
    jle skip
    mov rax, rbx
skip:
    ret

_start:
    lea rdi, [array]
    mov rsi, count
    call find_max
    mov rdi, rax
    mov rax, 60
    syscall
