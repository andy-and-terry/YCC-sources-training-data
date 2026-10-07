; x86-64 NASM: fill a buffer with a byte value using rep stosb, then verify it
section .bss
    buffer resb 16

section .text
    global _start

_start:
    lea rdi, [buffer]
    mov al, 0x41               ; fill byte 'A'
    mov rcx, 16
    cld                        ; direction flag clear: increment rdi
    rep stosb

    ; verify: count bytes equal to 'A'
    lea rsi, [buffer]
    mov rcx, 16
    xor rbx, rbx
verify_loop:
    cmp byte [rsi], 0x41
    jne not_match
    inc rbx
not_match:
    inc rsi
    dec rcx
    jnz verify_loop

    ; exit with the match count (16)
    mov rdi, rbx
    mov rax, 60
    syscall
