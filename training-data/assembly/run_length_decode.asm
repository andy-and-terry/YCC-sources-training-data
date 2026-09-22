; x86-64 NASM: decode a single-digit run-length encoded string,
; e.g. "3a3b4c1d" -> "aaabbbccccd" (the reverse of run_length_encode.asm)
section .data
    input db "3a3b4c1d", 0

section .bss
    output resb 64

section .text
    global _start

_start:
    lea rsi, [input]         ; read pointer
    lea rdi, [output]        ; write pointer

decode_loop:
    mov al, [rsi]
    cmp al, 0
    je decode_done

    movzx rcx, al               ; digit character
    sub rcx, '0'                  ; rcx = run count
    inc rsi
    mov bl, [rsi]                   ; character to repeat
    inc rsi

repeat_loop:
    cmp rcx, 0
    je decode_loop
    mov [rdi], bl
    inc rdi
    dec rcx
    jmp repeat_loop

decode_done:
    mov byte [rdi], 0
    lea rax, [output]
    sub rdi, rax                 ; rdi = length of the decoded string
    mov rax, 60
    syscall
