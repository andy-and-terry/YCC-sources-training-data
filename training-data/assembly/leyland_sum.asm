; x86-64 NASM: Leyland numbers x^y + y^x for 2 <= y <= x <= 3, summed.
; 8 + 17 + 54 = 79 -> exit code 79
section .text
    global _start

; ipow(rdi = base, rsi = exp) -> rax
ipow:
    mov rax, 1
.loop:
    test rsi, rsi
    jz .done
    imul rax, rdi
    dec rsi
    jmp .loop
.done:
    ret

_start:
    xor r12, r12            ; running sum
    mov r13, 2              ; x
.xloop:
    mov r14, 2              ; y
.yloop:
    mov rdi, r13
    mov rsi, r14
    call ipow
    mov r15, rax            ; x^y
    mov rdi, r14
    mov rsi, r13
    call ipow               ; y^x
    add r15, rax
    add r12, r15
    inc r14
    cmp r14, r13
    jle .yloop
    inc r13
    cmp r13, 3
    jle .xloop
    mov rdi, r12
    mov rax, 60
    syscall
