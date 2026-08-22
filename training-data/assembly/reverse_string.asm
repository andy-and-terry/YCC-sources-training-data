; x86-64 NASM: reverse a null-terminated string in place
section .data
    msg db "hello", 0

section .text
    global _start

_start:
    lea rsi, [msg]        ; rsi = start pointer
    lea rdi, [msg]
find_end:
    cmp byte [rdi], 0
    je found_end
    inc rdi
    jmp find_end
found_end:
    dec rdi                ; rdi = pointer to last char

reverse_loop:
    cmp rsi, rdi
    jge reverse_done
    mov al, [rsi]
    mov bl, [rdi]
    mov [rsi], bl
    mov [rdi], al
    inc rsi
    dec rdi
    jmp reverse_loop
reverse_done:
    ; msg now holds "olleh"; exit cleanly
    mov rdi, 0
    mov rax, 60
    syscall
