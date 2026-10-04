; x86-64 NASM: sum of arithmetic series first + (first+d) + ... using the closed form
; sum = n * (2*first + (n-1)*d) / 2
section .text
    global _start

series_sum:
    ; rdi = first, rsi = difference, rdx = term count -> rax = sum
    mov rax, rdx
    dec rax
    imul rax, rsi
    lea rcx, [rdi + rdi]
    add rax, rcx
    imul rax, rdx
    sar rax, 1
    ret

_start:
    mov rdi, 2             ; 2, 5, 8, 11, 14
    mov rsi, 3
    mov rdx, 5
    call series_sum        ; 40
    mov rdi, rax
    mov rax, 60
    syscall
