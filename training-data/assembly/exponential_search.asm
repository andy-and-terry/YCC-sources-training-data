; x86-64 NASM: exponential search - find a bound by doubling, then
; binary-search within that bound
section .data
    array dq 1, 3, 5, 7, 9, 11, 13, 15, 17
    count equ 9
    target equ 13

section .text
    global _start

_start:
    mov rax, 1                ; bound
find_bound:
    cmp rax, count
    jge bound_found
    cmp qword [array + rax * 8], target
    jge bound_found
    shl rax, 1
    jmp find_bound
bound_found:
    mov rbx, rax
    shr rbx, 1                 ; low = bound / 2
    mov rcx, count - 1
    cmp rax, rcx
    jle cap_ok
    mov rax, rcx
cap_ok:                        ; high = min(bound, count - 1)

binary_loop:
    cmp rbx, rax
    jg not_found
    mov rdx, rbx
    add rdx, rax
    shr rdx, 1                  ; mid = (low + high) / 2
    mov rsi, [array + rdx * 8]
    cmp rsi, target
    je found
    jl search_right
    mov rax, rdx
    dec rax
    jmp binary_loop
search_right:
    mov rbx, rdx
    inc rbx
    jmp binary_loop
found:
    mov rdi, rdx                ; index = 6
    jmp exit
not_found:
    mov rdi, -1
exit:
    mov rax, 60
    syscall
