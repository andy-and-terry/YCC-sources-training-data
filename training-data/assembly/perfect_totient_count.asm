; x86-64 NASM: count perfect totient numbers below 200 (the sum of the
; iterated totient chain down to 1 equals n).
; Expected: 8 (3 9 15 27 39 81 111 183) -> exit code 8
section .text
    global _start

; gcd(rdi, rsi) -> rax
gcd:
    mov rax, rdi
    mov rcx, rsi
.loop:
    test rcx, rcx
    jz .done
    xor rdx, rdx
    div rcx
    mov rax, rcx
    mov rcx, rdx
    jmp .loop
.done:
    ret

; phi(rdi = n) -> rax
phi:
    push r12
    push r13
    push r14
    mov r12, rdi            ; n
    xor r13, r13            ; count
    mov r14, 1              ; k
.loop:
    cmp r14, r12
    jg .done
    mov rdi, r14
    mov rsi, r12
    call gcd
    cmp rax, 1
    jne .skip
    inc r13
.skip:
    inc r14
    jmp .loop
.done:
    mov rax, r13
    pop r14
    pop r13
    pop r12
    ret

; chain_sum(rdi = n) -> rax
chain_sum:
    push r12
    push r13
    mov r12, rdi            ; m
    xor r13, r13            ; total
.loop:
    cmp r12, 1
    jle .done
    mov rdi, r12
    call phi
    mov r12, rax
    add r13, rax
    jmp .loop
.done:
    mov rax, r13
    pop r13
    pop r12
    ret

_start:
    xor r15, r15            ; count
    mov rbx, 2              ; n
.next:
    cmp rbx, 200
    jge .finish
    mov rdi, rbx
    call chain_sum
    cmp rax, rbx
    jne .advance
    inc r15
.advance:
    inc rbx
    jmp .next
.finish:
    mov rax, 60
    mov rdi, r15
    syscall
