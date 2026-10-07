; x86-64 NASM: even parity of the low byte using the parity flag (PF)
section .text
    global _start

_start:
    mov al, 0b10110000   ; three set bits -> odd parity
    test al, al          ; updates PF from the low byte
    jp  even_parity
    mov edi, 0           ; odd parity -> exit status 0
    jmp done
even_parity:
    mov edi, 1
done:
    mov eax, 60
    syscall
