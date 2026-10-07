; x86-64 NASM: a %macro that adds two values and clamps the result to zero
; if it went negative, reused via a single expansion below
section .text
    global _start

%macro ADD_CLAMPED 2
    add %1, %2
    cmp %1, 0
    jge %%skip
    xor %1, %1
%%skip:
%endmacro

_start:
    mov rax, 5
    ADD_CLAMPED rax, -20    ; 5 + (-20) = -15 -> clamped to 0
    mov rdi, rax
    mov rax, 60
    syscall
