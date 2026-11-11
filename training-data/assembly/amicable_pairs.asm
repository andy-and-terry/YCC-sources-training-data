; x86-64 NASM: d(220) = sum of proper divisors = 284 (220 and 284 are amicable)
; exit status: 28  (284 & 0xFF)
section .text
    global _start

_start:
    mov r8, 220                ; n
    xor r9, r9                 ; sum
    mov rcx, 1                 ; i
.loop:
    cmp rcx, r8
    jae .done
    mov rax, r8
    xor rdx, rdx
    div rcx
    test rdx, rdx
    jnz .next
    add r9, rcx
.next:
    inc rcx
    jmp .loop
.done:
    mov rdi, r9
    mov rax, 60
    syscall
