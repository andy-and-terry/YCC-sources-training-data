; x86-64 NASM: count trailing zero bits using bsf (exit code = result)
section .text
    global _start

count_trailing_zeros:
    ; rdi = value -> rax = number of trailing zeros (64 if value is 0)
    test rdi, rdi
    jnz .nonzero
    mov rax, 64
    ret
.nonzero:
    bsf rax, rdi
    ret

_start:
    mov rdi, 40            ; 0b101000 -> 3 trailing zeros
    call count_trailing_zeros
    mov rdi, rax
    mov rax, 60
    syscall
