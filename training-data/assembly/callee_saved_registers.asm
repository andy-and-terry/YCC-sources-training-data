; x86-64 NASM: preserve rbx and r12 across a function that uses them
; exit status: 9
section .text
    global _start

clobber:
    push rbx
    push r12
    mov rbx, 1000
    mov r12, 2000
    add rbx, r12
    pop r12
    pop rbx
    ret

_start:
    mov rbx, 4
    mov r12, 5
    call clobber
    lea rdi, [rbx + r12]       ; 4 + 5 still intact
    mov rax, 60
    syscall
