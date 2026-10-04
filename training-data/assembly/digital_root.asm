; x86-64 NASM: digital root (repeated digit sum) of a number
section .text
    global _start

digital_root:
    ; rdi = n -> rax = digital root
    mov rax, rdi
.outer:
    cmp rax, 10
    jb .done
    xor rsi, rsi
    mov rcx, 10
.digits:
    xor rdx, rdx
    div rcx
    add rsi, rdx
    test rax, rax
    jnz .digits
    mov rax, rsi
    jmp .outer
.done:
    ret

_start:
    mov rdi, 9875          ; 9+8+7+5=29 -> 2+9=11 -> 1+1=2
    call digital_root
    mov rdi, rax
    mov rax, 60
    syscall
