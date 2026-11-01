; x86-64 NASM: eighth Mian-Chowla term via a greedy search with a bitmap of
; used sums. Expected exit code: 45
section .data
    seq   times 8 dq 0

section .bss
    used  resb 256
    fresh resb 256

section .text
    global _start

_start:
    xor r12, r12            ; n (terms accepted)
    mov r13, 1              ; candidate
.try:
    ; clear fresh[]
    lea rdi, [rel fresh]
    mov rcx, 256
    xor eax, eax
    rep stosb
    lea rbx, [rel seq]
    mov [rbx + r12*8], r13  ; seq[n] = cand
    xor r14, r14            ; i
.sums:
    mov rax, [rbx + r14*8]
    add rax, r13            ; s = seq[i] + cand
    lea rsi, [rel used]
    cmp byte [rsi + rax], 0
    jne .reject
    lea rdi, [rel fresh]
    cmp byte [rdi + rax], 0
    jne .reject
    mov byte [rdi + rax], 1
    inc r14
    cmp r14, r12
    jbe .sums
    ; accept: merge fresh into used
    xor rcx, rcx
.merge:
    lea rdi, [rel fresh]
    cmp byte [rdi + rcx], 0
    je .nomerge
    lea rsi, [rel used]
    mov byte [rsi + rcx], 1
.nomerge:
    inc rcx
    cmp rcx, 256
    jb .merge
    inc r12
    cmp r12, 8
    je .done
.reject:
    inc r13
    jmp .try
.done:
    mov rdi, r13
    mov rax, 60
    syscall
