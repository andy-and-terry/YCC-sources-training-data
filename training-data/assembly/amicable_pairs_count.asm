; x86-64 NASM: count amicable pairs (a < b) with a < 1500.
; Expected: 2 pairs ((220,284) and (1184,1210)) -> exit code 2
section .text
    global _start

; sum_div(rdi = n) -> rax = sum of proper divisors
sum_div:
    xor rax, rax
    mov rcx, 1
.loop:
    cmp rcx, rdi
    jge .done
    mov r8, rax             ; save sum
    mov rax, rdi
    xor rdx, rdx
    div rcx
    mov rax, r8
    test rdx, rdx
    jnz .skip
    add rax, rcx
.skip:
    inc rcx
    jmp .loop
.done:
    ret

_start:
    xor r12, r12            ; pair count
    mov r13, 2              ; a
.next:
    cmp r13, 1500
    jge .finish
    mov rdi, r13
    call sum_div
    mov r14, rax            ; b = s(a)
    cmp r14, r13
    jle .advance            ; need b > a
    mov rdi, r14
    call sum_div
    cmp rax, r13
    jne .advance
    inc r12
.advance:
    inc r13
    jmp .next
.finish:
    mov rax, 60
    mov rdi, r12
    syscall
