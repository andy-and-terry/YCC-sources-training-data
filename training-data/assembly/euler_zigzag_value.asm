; x86-64 NASM: Euler zigzag number A(6) via the Seidel-Entringer boustrophedon.
; Expected: 61 -> exit code 61
section .bss
    row  resq 16
    next resq 16

section .text
    global _start

_start:
    mov qword [row], 1
    mov r8, 1               ; len
    mov r9, 6               ; steps
.step:
    mov qword [next], 0
    mov rcx, 1              ; j = 1..len
.fill:
    cmp rcx, r8
    jg .copy_prep
    mov rax, r8
    sub rax, rcx
    mov rax, [row + rax*8]  ; row[len - j]
    add rax, [next + rcx*8 - 8]
    mov [next + rcx*8], rax
    inc rcx
    jmp .fill
.copy_prep:
    inc r8
    xor rcx, rcx
.copy:
    cmp rcx, r8
    jge .after
    mov rax, [next + rcx*8]
    mov [row + rcx*8], rax
    inc rcx
    jmp .copy
.after:
    dec r9
    jnz .step
    mov rdi, [row + r8*8 - 8]
    mov rax, 60
    syscall
