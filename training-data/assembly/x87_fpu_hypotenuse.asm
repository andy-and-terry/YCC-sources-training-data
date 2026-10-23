; x86-64 NASM: legacy x87 FPU stack computes sqrt(3^2 + 4^2)
section .data
    a   dq 3.0
    b   dq 4.0

section .bss
    result resq 1

section .text
    global _start

_start:
    fld qword [rel a]       ; st0 = 3.0
    fmul st0, st0           ; st0 = 9.0
    fld qword [rel b]       ; st0 = 4.0, st1 = 9.0
    fmul st0, st0           ; st0 = 16.0
    faddp st1, st0          ; st0 = 25.0, stack popped
    fsqrt                   ; st0 = 5.0
    fstp qword [rel result] ; store and pop

    cvttsd2si rdi, [rel result]
    mov rax, 60
    syscall                 ; exit(5)
