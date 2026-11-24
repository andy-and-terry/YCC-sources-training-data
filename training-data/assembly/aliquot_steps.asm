; x86-64 NASM: number of aliquot steps from 12 down to 1 (12 16 15 9 4 3 1).
; Expected: 6 -> exit code 6
section .text
    global _start

; aliquot_sum(rdi = n) -> rax = sum of proper divisors
aliquot_sum:
    xor rax, rax
    mov rsi, rdi
    shr rsi, 1              ; n / 2
    mov rcx, 1              ; d
.d_loop:
    cmp rcx, rsi
    jg .ret
    mov r10, rax            ; save running sum
    mov rax, rdi
    xor rdx, rdx
    div rcx
    mov rax, r10
    test rdx, rdx
    jnz .next
    add rax, rcx
.next:
    inc rcx
    jmp .d_loop
.ret:
    ret

_start:
    mov rdi, 12
    xor r12, r12            ; steps
.loop:
    cmp rdi, 1
    jle .done
    call aliquot_sum
    mov rdi, rax
    inc r12
    jmp .loop
.done:
    mov rdi, r12
    mov rax, 60
    syscall
