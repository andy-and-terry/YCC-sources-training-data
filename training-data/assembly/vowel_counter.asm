; x86-64 NASM: count lowercase vowels in "education"
; exit status: 5
section .data
text: db "education", 0

section .text
    global _start

_start:
    xor rdi, rdi
    mov rsi, text
.loop:
    movzx rax, byte [rsi]
    test al, al
    jz .done
    cmp al, 'a'
    je .hit
    cmp al, 'e'
    je .hit
    cmp al, 'i'
    je .hit
    cmp al, 'o'
    je .hit
    cmp al, 'u'
    jne .next
.hit:
    inc rdi
.next:
    inc rsi
    jmp .loop
.done:
    mov rax, 60
    syscall
