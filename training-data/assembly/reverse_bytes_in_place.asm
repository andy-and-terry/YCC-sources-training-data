; x86-64 NASM: reverse a 5-byte string in place, return first byte ('o' = 111)
; exit status: 111
section .data
    buf db "hello"
section .text
    global _start

_start:
    lea rsi, [rel buf]
    lea rdi, [rel buf + 4]
swap:
    cmp rsi, rdi
    jge done
    mov al, [rsi]
    mov bl, [rdi]
    mov [rsi], bl
    mov [rdi], al
    inc rsi
    dec rdi
    jmp swap
done:
    movzx rdi, byte [buf]
    mov rax, 60
    syscall
