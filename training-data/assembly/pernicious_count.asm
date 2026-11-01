; x86-64 NASM: count pernicious numbers (prime popcount) in 1..20.
; Expected exit code: 14
section .text
    global _start

_start:
    xor r12, r12            ; count
    mov r13, 1              ; n
.next:
    popcnt rbx, r13         ; rbx = popcount(n)
    cmp rbx, 2
    jb .skip
    mov rcx, 2              ; d
.trial:
    mov rax, rcx
    imul rax, rax
    cmp rax, rbx
    ja .prime
    mov rax, rbx
    xor rdx, rdx
    div rcx
    test rdx, rdx
    jz .skip
    inc rcx
    jmp .trial
.prime:
    inc r12
.skip:
    inc r13
    cmp r13, 20
    jle .next
    mov rdi, r12
    mov rax, 60
    syscall
