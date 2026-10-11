; x86-64 NASM: nested function calls accumulating depth
; exit status: 3
section .text
    global _start

level3:
    lea rax, [rdi + 1]
    ret
level2:
    inc rdi
    call level3
    ret
level1:
    inc rdi
    call level2
    ret

_start:
    xor rdi, rdi
    call level1
    mov rdi, rax
    mov rax, 60
    syscall
