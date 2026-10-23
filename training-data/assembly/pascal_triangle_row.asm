; x86-64 NASM: compute row 5 of Pascal's triangle in place (1 5 10 10 5 1)
section .data
    row dq 1, 0, 0, 0, 0, 0

section .text
    global _start

_start:
    mov rcx, 1           ; current row index
outer:
    cmp rcx, 5
    ja done
    mov rsi, rcx         ; j = i
inner:
    mov rax, [row + rsi*8 - 8]
    add [row + rsi*8], rax
    dec rsi
    jnz inner
    inc rcx
    jmp outer
done:
    mov rdi, [row + 2*8] ; 10
    mov rax, 60
    syscall
