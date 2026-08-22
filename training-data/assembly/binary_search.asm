; x86-64 NASM: binary search over a sorted array
section .data
    array dq 1, 3, 5, 7, 9, 11, 13
    count equ 7
    target dq 7

section .text
    global _start

_start:
    xor r8, r8              ; low = 0
    mov r9, count
    dec r9                  ; high = count - 1
    mov r10, [target]

search_loop:
    cmp r8, r9
    jg not_found
    mov rax, r8
    add rax, r9
    xor rdx, rdx
    mov rcx, 2
    div rcx                  ; rax = (low + high) / 2
    mov rbx, [array + rax * 8]
    cmp rbx, r10
    je found
    jl go_right
    dec rax
    mov r9, rax
    jmp search_loop
go_right:
    inc rax
    mov r8, rax
    jmp search_loop

found:
    mov rdi, rax
    jmp done
not_found:
    mov rdi, -1
done:
    mov rax, 60
    syscall
