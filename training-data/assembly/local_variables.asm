; x86-64 NASM: allocate stack-frame local variables in a function
section .text
    global _start

compute:
    push rbp
    mov rbp, rsp
    sub rsp, 16           ; two local qwords
    mov qword [rbp - 8], 10
    mov qword [rbp - 16], 20
    mov rax, [rbp - 8]
    add rax, [rbp - 16]
    mov rsp, rbp
    pop rbp
    ret

_start:
    call compute
    mov rdi, rax
    mov rax, 60
    syscall
