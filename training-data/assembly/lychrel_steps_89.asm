; x86-64 NASM: reverse-and-add steps until 89 becomes a palindrome.
; Expected exit code: 24
section .text
    global _start

; reverse_digits(rdi = n) -> rax
reverse_digits:
    xor rax, rax
    mov rcx, 10
.loop:
    test rdi, rdi
    jz .done
    imul rax, rcx
    mov r8, rax
    mov rax, rdi
    xor rdx, rdx
    div rcx                 ; rax = n/10, rdx = n%10
    mov rdi, rax
    lea rax, [r8 + rdx]
    jmp .loop
.done:
    ret

_start:
    mov r12, 89             ; n
    xor r13, r13            ; count
.again:
    mov rdi, r12
    call reverse_digits
    test r13, r13
    jz .add
    cmp rax, r12
    je .finish
.add:
    add r12, rax
    inc r13
    jmp .again
.finish:
    mov rdi, r13
    mov rax, 60
    syscall
