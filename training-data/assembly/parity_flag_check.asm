; x86-64 NASM: test whether a byte has an even number of set bits using the parity flag
section .text
    global _start

_start:
    mov al, 0b10110100         ; four 1-bits -> even parity
    test al, al                ; sets PF based on the low byte of the result
    jp even_parity
    mov rdi, 1                 ; odd parity
    jmp done
even_parity:
    mov rdi, 0                 ; even parity -> exit status 0
done:
    mov rax, 60
    syscall
