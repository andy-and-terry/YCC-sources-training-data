; x86-64 NASM: 0/1 knapsack via bottom-up dynamic programming
; weights/values describe 4 items; dp[i][w] = best value using the first
; i items with capacity w. dp is stored row-major with stride (capacity+1).
section .data
    weights dq 2, 3, 4, 5
    values  dq 3, 4, 5, 6
    n equ 4
    capacity equ 5
    stride equ capacity + 1

section .bss
    dp resq (n + 1) * stride     ; zero-initialized: dp[0][*] = 0 for free

section .text
    global _start

_start:
    mov r8, 1                     ; i = 1
outer_loop:
    cmp r8, n
    jg done

    mov rax, r8
    dec rax
    mov r10, [weights + rax * 8]   ; wt = weights[i - 1]
    mov r11, [values + rax * 8]    ; val = values[i - 1]

    xor r9, r9                      ; w = 0
inner_loop:
    cmp r9, capacity
    jg inner_done

    mov rax, r8
    imul rax, stride
    add rax, r9
    mov r12, rax                     ; idx_cur = i * stride + w

    mov r13, r12
    sub r13, stride                    ; idx_prev_same_w = idx_cur - stride
    mov r14, [dp + r13 * 8]             ; dp[i - 1][w]

    cmp r9, r10
    jl skip_item                          ; w < wt: cannot take the item

    mov rbx, r13
    sub rbx, r10                            ; idx of dp[i - 1][w - wt]
    mov r15, [dp + rbx * 8]
    add r15, r11                             ; candidate = dp[i-1][w-wt] + val

    cmp r15, r14
    jle use_prev
    mov [dp + r12 * 8], r15
    jmp inner_next
use_prev:
skip_item:
    mov [dp + r12 * 8], r14

inner_next:
    inc r9
    jmp inner_loop
inner_done:
    inc r8
    jmp outer_loop

done:
    mov rax, n
    imul rax, stride
    add rax, capacity
    mov rdi, [dp + rax * 8]      ; best value achievable within capacity
    mov rax, 60
    syscall
