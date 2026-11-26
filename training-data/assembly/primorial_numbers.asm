; x86-64 NASM: count of primorials up to 1e6 (including 1)
; Expected result 8 is returned as the process exit code.
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

_start:
    mov r12, 1              ; count (the primorial 1)
    mov r13, 1              ; accumulator
    mov r14, 2              ; candidate prime
.next:
    mov rdi, r14
    call is_prime
    test rax, rax
    jz .adv
    imul r13, r14
    cmp r13, 1000000
    jg .done
    inc r12
.adv:
    inc r14
    jmp .next
.done:
    mov rdi, r12
    mov eax, 60
    syscall
