; x86-64 NASM: Goldbach partitions of 100 (p <= q)
; Expected result 6 is returned as the process exit code.
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
    xor r12, r12            ; count
    mov r13, 2
.next:
    cmp r13, 51
    jge .done
    mov rdi, r13
    call is_prime
    test rax, rax
    jz .skip
    mov rdi, 100
    sub rdi, r13
    call is_prime
    add r12, rax
.skip:
    inc r13
    jmp .next
.done:
    mov rdi, r12
    mov eax, 60
    syscall
