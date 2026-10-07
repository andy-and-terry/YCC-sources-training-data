; x86-64 NASM: copy a NUL-terminated string with lodsb/stosb
section .data
    src db "copy me", 0

section .bss
    dst resb 16

section .text
    global _start

_start:
    lea rsi, [rel src]
    lea rdi, [rel dst]
    cld
copy:
    lodsb
    stosb
    test al, al
    jnz copy
    lea rax, [rel dst]
    sub rdi, rax         ; bytes written including NUL = 8
    dec rdi              ; length = 7
    mov eax, 60
    syscall
