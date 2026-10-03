; x86-64 NASM: recursive Ackermann function, ackermann(2, 3)
; rdi = m, rsi = n; result returned in rax
section .text
    global _start

_start:
    mov rdi, 2
    mov rsi, 3
    call ackermann
    mov rdi, rax
    mov rax, 60
    syscall

; rax = ackermann(rdi, rsi)
ackermann:
    push rbx
    cmp rdi, 0
    jne m_nonzero
    mov rax, rsi
    inc rax
    pop rbx
    ret
m_nonzero:
    cmp rsi, 0
    jne n_nonzero
    dec rdi
    mov rsi, 1
    call ackermann
    pop rbx
    ret
n_nonzero:
    mov rbx, rdi          ; save m
    dec rsi
    call ackermann         ; rax = ackermann(m, n-1)
    mov rsi, rax
    mov rdi, rbx
    dec rdi
    call ackermann
    pop rbx
    ret
