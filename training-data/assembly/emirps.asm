; x86-64 NASM: emirps below 200
; Expected result 15 is returned as the process exit code.
section .text
    global _start

; is_prime(rdi = n) -> rax = 1 if prime else 0 (clobbers rcx, rdx, r8)
is_prime:
    xor eax, eax
    cmp rdi, 2
    jl .ret
    mov rcx, 2
.loop:
    mov r8, rcx
    imul r8, rcx
    cmp r8, rdi
    jg .yes
    mov rax, rdi
    xor edx, edx
    div rcx
    test rdx, rdx
    jz .no
    inc rcx
    jmp .loop
.yes:
    mov eax, 1
    ret
.no:
    xor eax, eax
.ret:
    ret

; rev(rdi = n) -> rax = digit reversal (clobbers rcx, rdx)
rev:
    xor eax, eax
    mov rcx, 10
.rl:
    test rdi, rdi
    jz .rd
    imul rax, rcx
    mov rsi, rax
    mov rax, rdi
    xor edx, edx
    div rcx
    mov rdi, rax
    lea rax, [rsi + rdx]
    jmp .rl
.rd:
    ret

_start:
    xor r12, r12            ; count
    mov r13, 2
.next:
    cmp r13, 200
    jge .done
    mov rdi, r13
    call rev
    cmp rax, r13
    je .skip
    mov r14, rax
    mov rdi, r13
    call is_prime
    test rax, rax
    jz .skip
    mov rdi, r14
    call is_prime
    add r12, rax
.skip:
    inc r13
    jmp .next
.done:
    mov rdi, r12
    mov eax, 60
    syscall
