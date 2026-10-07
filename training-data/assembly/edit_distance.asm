; x86-64 NASM: Levenshtein edit distance between "horse" and "ros" via
; bottom-up dynamic programming (classic example, expected result: 3).
section .data
    s1 db "horse"
    len1 equ 5
    s2 db "ros"
    len2 equ 3
    stride equ len2 + 1

section .bss
    dp resq (len1 + 1) * stride

section .text
    global _start

_start:
    ; base case: dp[i][0] = i
    xor r8, r8
init_col:
    cmp r8, len1
    jg init_col_done
    mov rax, r8
    imul rax, stride
    mov [dp + rax * 8], r8
    inc r8
    jmp init_col
init_col_done:

    ; base case: dp[0][j] = j
    xor r9, r9
init_row:
    cmp r9, len2
    jg init_row_done
    mov [dp + r9 * 8], r9
    inc r9
    jmp init_row
init_row_done:

    mov r8, 1                       ; i = 1
outer_loop:
    cmp r8, len1
    jg outer_done

    mov r10, r8
    dec r10
    movzx r13, byte [s1 + r10]        ; r13 = s1[i - 1]

    mov r9, 1                          ; j = 1
inner_loop:
    cmp r9, len2
    jg inner_done

    mov r11, r9
    dec r11
    movzx r14, byte [s2 + r11]          ; r14 = s2[j - 1]

    mov rax, r8
    imul rax, stride
    add rax, r9
    mov r12, rax                          ; idx_cur = i * stride + j

    mov r15, r12
    sub r15, stride
    sub r15, 1                              ; idx(i - 1, j - 1)

    cmp r13, r14
    jne compute_min

    mov rcx, [dp + r15 * 8]
    mov [dp + r12 * 8], rcx
    jmp inner_next

compute_min:
    mov rax, r12
    sub rax, stride
    mov rax, [dp + rax * 8]                ; dp[i - 1][j]

    mov rbx, r12
    sub rbx, 1
    mov rbx, [dp + rbx * 8]                 ; dp[i][j - 1]

    mov rcx, [dp + r15 * 8]                  ; dp[i - 1][j - 1]

    mov rdx, rax
    cmp rbx, rdx
    jge skip1
    mov rdx, rbx
skip1:
    cmp rcx, rdx
    jge skip2
    mov rdx, rcx
skip2:
    inc rdx
    mov [dp + r12 * 8], rdx

inner_next:
    inc r9
    jmp inner_loop
inner_done:
    inc r8
    jmp outer_loop
outer_done:
    mov rax, len1
    imul rax, stride
    add rax, len2
    mov rdi, [dp + rax * 8]         ; final edit distance
    mov rax, 60
    syscall
