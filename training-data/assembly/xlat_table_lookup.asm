; x86-64 NASM: translate digits to ASCII letters with a lookup table using xlatb
section .data
    hex_map db "0123456789ABCDEF"

section .bss
    out_buf resb 8

section .text
    global _start

_start:
    lea rbx, [hex_map]         ; xlatb uses rbx as the table base
    lea rdi, [out_buf]

    mov al, 10
    xlatb                      ; al = hex_map[al] = 'A'
    mov [rdi], al
    inc rdi

    mov al, 15
    xlatb                      ; 'F'
    mov [rdi], al
    inc rdi

    mov al, 3
    xlatb                      ; '3'
    mov [rdi], al

    ; exit with the first translated character: 'A' = 65
    movzx rdi, byte [out_buf]
    mov rax, 60
    syscall
