; x86-64 NASM: count triangular numbers in 0..20 using the 8n+1 square test.
; Expected exit code: 6 (0 1 3 6 10 15)
section .text
    global _start

_start:
    xor r12, r12            ; count
    xor r13, r13            ; n
.next:
    lea rbx, [r13*8 + 1]    ; s = 8n + 1
    xor rcx, rcx            ; r = 0
.root:
    lea rax, [rcx + 1]
    imul rax, rax
    cmp rax, rbx
    ja .check
    inc rcx
    jmp .root
.check:
    mov rax, rcx
    imul rax, rax
    cmp rax, rbx
    jne .skip
    inc r12
.skip:
    inc r13
    cmp r13, 20
    jle .next
    mov rdi, r12
    mov rax, 60
    syscall
