; x86-64 NASM: reverse the decimal digits of 1234 -> 4321
; exit status: 225  (4321 & 0xFF)
section .text
    global _start

_start:
    mov rax, 1234
    xor rbx, rbx               ; reversed
    mov rcx, 10
.loop:
    test rax, rax
    jz .done
    xor rdx, rdx
    div rcx                    ; rax = quotient, rdx = last digit
    imul rbx, rbx, 10
    add rbx, rdx
    jmp .loop
.done:
    mov rdi, rbx
    mov rax, 60
    syscall
