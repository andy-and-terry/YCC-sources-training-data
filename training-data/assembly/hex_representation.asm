; x86-64 NASM: convert a byte value into its 2-character hex representation
section .data
    hex_digits db "0123456789abcdef"
    value db 0xB7               ; byte to convert (183)

section .bss
    hex_out resb 2

section .text
    global _start

_start:
    movzx rax, byte [value]

    mov rbx, rax
    shr rbx, 4                  ; high nibble
    mov cl, [hex_digits + rbx]
    mov [hex_out], cl

    mov rbx, rax
    and rbx, 0x0F                ; low nibble
    mov cl, [hex_digits + rbx]
    mov [hex_out + 1], cl

    ; hex_out now holds "b7"; exit with the original byte value as status
    movzx rdi, byte [value]
    mov rax, 60
    syscall
