; x86-64 NASM: add eight packed floats at once with AVX (ymm registers)
section .data
    align 32
    vec_a   dd 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0
    vec_b   dd 8.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.0, 1.0

section .bss
    align 32
    vec_out resd 8

section .text
    global _start

_start:
    vmovaps ymm0, [rel vec_a]
    vmovaps ymm1, [rel vec_b]
    vaddps  ymm2, ymm0, ymm1        ; every lane becomes 9.0
    vmovaps [rel vec_out], ymm2
    vzeroupper                      ; avoid AVX/SSE transition penalty

    cvttss2si rdi, [rel vec_out + 20]   ; lane 5 -> 9
    mov rax, 60
    syscall                             ; exit(9)
