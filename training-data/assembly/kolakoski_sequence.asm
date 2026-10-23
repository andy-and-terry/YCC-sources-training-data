; x86-64 NASM: first 20 terms of the Kolakoski sequence, exit with their sum (30)
section .bss
    seq resb 32

section .text
    global _start

_start:
    mov byte [seq], 1
    mov byte [seq + 1], 2
    mov byte [seq + 2], 2
    mov rsi, 3              ; len = 3
    mov rbx, 2              ; i = index of the next run length
kolakoski_loop:
    cmp rsi, 20
    jge kolakoski_sum
    movzx ecx, byte [seq + rbx] ; run length
    mov edx, 1              ; even index -> run of 1s
    test bl, 1
    jz kolakoski_fill
    mov edx, 2              ; odd index -> run of 2s
kolakoski_fill:
    test ecx, ecx
    jz kolakoski_next
    mov [seq + rsi], dl
    inc rsi
    dec ecx
    jmp kolakoski_fill
kolakoski_next:
    inc rbx
    jmp kolakoski_loop
kolakoski_sum:
    xor rdi, rdi
    xor rcx, rcx
kolakoski_add:
    movzx eax, byte [seq + rcx]
    add rdi, rax
    inc rcx
    cmp rcx, 20
    jl kolakoski_add
    mov rax, 60             ; sys_exit(sum)
    syscall
