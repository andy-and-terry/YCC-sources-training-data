; x86-64 NASM: alternating digit sum of 1234 (4 - 3 + 2 - 1 = 2)
section .text
    global _start

_start:
    mov rax, 1234
    mov rbx, 10
    xor rsi, rsi        ; total
    mov rdi, 1          ; sign
digit_loop:
    test rax, rax
    jz done
    xor rdx, rdx
    div rbx             ; rdx = digit, rax = rest
    imul rdx, rdi
    add rsi, rdx
    neg rdi
    jmp digit_loop
done:
    mov rdi, rsi
    mov rax, 60
    syscall
