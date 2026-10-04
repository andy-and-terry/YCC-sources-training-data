; x86-64 NASM: binary to Gray code and back
section .text
    global _start

to_gray:
    ; rdi = n -> rax = n ^ (n >> 1)
    mov rax, rdi
    shr rax, 1
    xor rax, rdi
    ret

from_gray:
    ; rdi = gray -> rax = binary
    mov rax, rdi
.loop:
    shr rdi, 1
    jz .done
    xor rax, rdi
    jmp .loop
.done:
    ret

_start:
    mov rdi, 13            ; 0b1101 -> gray 0b1011 = 11
    call to_gray
    mov rdi, rax
    call from_gray         ; back to 13
    mov rdi, rax
    mov rax, 60
    syscall
