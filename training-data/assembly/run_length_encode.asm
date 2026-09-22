; x86-64 NASM: run-length encode a string, e.g. "aaabbbccccd" -> "3a3b4c1d"
section .data
    input db "aaabbbccccd", 0

section .bss
    output resb 32

section .text
    global _start

_start:
    lea rsi, [input]        ; read pointer
    lea rdi, [output]       ; write pointer

rle_loop:
    mov al, [rsi]
    cmp al, 0
    je rle_done

    mov bl, al                ; character starting this run
    xor rcx, rcx                ; run count
count_loop:
    mov al, [rsi]
    cmp al, bl
    jne count_done
    inc rcx
    inc rsi
    jmp count_loop
count_done:
    mov al, cl
    add al, '0'
    mov [rdi], al
    inc rdi
    mov [rdi], bl
    inc rdi
    jmp rle_loop

rle_done:
    mov byte [rdi], 0
    lea rax, [output]
    sub rdi, rax              ; rdi = length of the encoded string
    mov rax, 60
    syscall
