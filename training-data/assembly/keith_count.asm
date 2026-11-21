; x86-64 NASM: count Keith numbers in [10, 1200).
; Expected: 9 (14 19 28 47 61 75 197 742 1104) -> exit code 9
section .bss
    seq resq 64

section .text
    global _start

; is_keith(rdi = n) -> rax = 1/0
is_keith:
    ; count digits into rcx, store them reversed at seq[0..k-1]
    mov r8, rdi             ; m
    xor rcx, rcx            ; k
.digits:
    test r8, r8
    jz .have_k
    mov rax, r8
    xor rdx, rdx
    mov r9, 10
    div r9
    mov [seq + rcx*8], rdx  ; least significant first
    mov r8, rax
    inc rcx
    jmp .digits
.have_k:
    ; reverse seq[0..k-1] in place
    xor rsi, rsi
    mov rdx, rcx
    dec rdx
.rev:
    cmp rsi, rdx
    jge .rev_done
    mov rax, [seq + rsi*8]
    mov r8, [seq + rdx*8]
    mov [seq + rsi*8], r8
    mov [seq + rdx*8], rax
    inc rsi
    dec rdx
    jmp .rev
.rev_done:
    mov r10, rcx            ; len = k
.grow:
    mov rax, [seq + r10*8 - 8]
    cmp rax, rdi
    jge .check
    ; sum the last k terms
    xor r8, r8
    mov r9, r10
    sub r9, rcx             ; i = len - k
.sum:
    cmp r9, r10
    jge .sum_done
    add r8, [seq + r9*8]
    inc r9
    jmp .sum
.sum_done:
    mov [seq + r10*8], r8
    inc r10
    jmp .grow
.check:
    xor rax, rax
    cmp qword [seq + r10*8 - 8], rdi
    sete al
    ret

_start:
    xor r12, r12            ; count
    mov r13, 10
.next:
    cmp r13, 1200
    jge .finish
    mov rdi, r13
    call is_keith
    add r12, rax
    inc r13
    jmp .next
.finish:
    mov rax, 60
    mov rdi, r12
    syscall
