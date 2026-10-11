; x86-64 NASM: convert a hex character to its value
; exit status: 11
section .text
    global _start

hex_val:
    cmp dil, '9'
    jbe .digit
    or dil, 0x20               ; lowercase
    sub dil, 'a' - 10
    jmp .out
.digit:
    sub dil, '0'
.out:
    movzx rax, dil
    ret

_start:
    mov dil, 'B'
    call hex_val
    mov rdi, rax
    mov rax, 60
    syscall
