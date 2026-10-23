; x86-64 NASM: first 20 terms of Van Eck's sequence, exit with their sum (44)
section .bss
    seq resq 20

section .text
    global _start

_start:
    mov qword [seq], 0      ; a(0) = 0
    mov rcx, 1              ; n = 1
van_eck_loop:
    cmp rcx, 20
    jge van_eck_sum
    mov qword [seq + rcx*8], 0
    mov rax, [seq + rcx*8 - 8] ; last term
    mov rbx, rcx
    sub rbx, 2              ; k = n - 2
van_eck_scan:
    test rbx, rbx
    js van_eck_store        ; ran out of earlier terms -> 0
    cmp [seq + rbx*8], rax
    je van_eck_found
    dec rbx
    jmp van_eck_scan
van_eck_found:
    mov rdx, rcx
    dec rdx
    sub rdx, rbx            ; distance = n - 1 - k
    mov [seq + rcx*8], rdx
van_eck_store:
    inc rcx
    jmp van_eck_loop
van_eck_sum:
    xor rdi, rdi
    xor rcx, rcx
van_eck_add:
    add rdi, [seq + rcx*8]
    inc rcx
    cmp rcx, 20
    jl van_eck_add
    mov rax, 60             ; sys_exit(sum)
    syscall
