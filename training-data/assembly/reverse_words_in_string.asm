; x86-64 NASM: reverse the order of space-separated words in place by
; first reversing the whole buffer, then reversing each word back
section .data
    text db "the sky is blue", 0
    len equ $ - text - 1

section .text
    global _start

_start:
    ; reverse the entire buffer
    lea rsi, [text]
    mov rdi, len - 1
    call reverse_range

    ; walk the buffer reversing each word back to normal order
    xor rcx, rcx           ; start of current word
    xor rdx, rdx           ; scan index
scan_loop:
    cmp rdx, len
    jge flush_last
    cmp byte [text + rdx], ' '
    jne scan_next
    mov rsi, rcx
    mov rdi, rdx
    dec rdi
    call reverse_range
    mov rcx, rdx
    inc rcx
scan_next:
    inc rdx
    jmp scan_loop
flush_last:
    mov rsi, rcx
    mov rdi, len - 1
    call reverse_range

    mov rax, 60
    xor rdi, rdi
    syscall

; reverse text[rsi .. rdi] in place (indices, inclusive)
reverse_range:
    cmp rsi, rdi
    jge reverse_done
    mov al, [text + rsi]
    mov bl, [text + rdi]
    mov [text + rsi], bl
    mov [text + rdi], al
    inc rsi
    dec rdi
    jmp reverse_range
reverse_done:
    ret
