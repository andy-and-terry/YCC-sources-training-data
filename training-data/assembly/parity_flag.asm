; x86-64 NASM: compute even/odd parity of a byte using the parity flag
section .text
    global _start

_start:
    mov al, 0b01101001   ; four set bits -> even parity
    test al, al          ; PF reflects low byte parity
    jp .even
    mov rdi, 1           ; odd parity
    jmp .exit
.even:
    mov rdi, 0
.exit:
    mov rax, 60
    syscall
