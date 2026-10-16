; x86-64 NASM: uppercase a string in place, exit with 'H'
; exit status: 72
section .data
    text db "hello", 0

section .text
    global _start

_start:
    lea rsi, [text]
.next:
    mov al, [rsi]
    test al, al
    jz .done
    cmp al, 'a'
    jb .skip
    cmp al, 'z'
    ja .skip
    sub al, 32
    mov [rsi], al
.skip:
    inc rsi
    jmp .next
.done:
    movzx rdi, byte [text]
    mov rax, 60
    syscall
