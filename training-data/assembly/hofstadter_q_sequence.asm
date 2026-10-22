; x86-64 NASM: first 20 Hofstadter Q numbers; exit with Q(20) = 12
; Q(1) = Q(2) = 1, Q(n) = Q(n - Q(n-1)) + Q(n - Q(n-2))
section .bss
    q resq 21               ; 1-indexed

section .text
    global _start

_start:
    mov qword [q + 8], 1
    mov qword [q + 16], 1
    mov rcx, 3              ; n = 3
hof_loop:
    cmp rcx, 20
    jg hof_done
    mov rax, [q + rcx*8 - 8]    ; Q(n-1)
    mov rbx, rcx
    sub rbx, rax
    mov rdx, [q + rbx*8]        ; Q(n - Q(n-1))
    mov rax, [q + rcx*8 - 16]   ; Q(n-2)
    mov rbx, rcx
    sub rbx, rax
    add rdx, [q + rbx*8]        ; + Q(n - Q(n-2))
    mov [q + rcx*8], rdx
    inc rcx
    jmp hof_loop
hof_done:
    mov rdi, [q + 20*8]
    mov rax, 60
    syscall
