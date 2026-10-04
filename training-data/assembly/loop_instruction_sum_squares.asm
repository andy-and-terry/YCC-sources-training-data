; x86-64 NASM: sum of squares 1..10 using the loop instruction (counts down rcx)
section .text
    global _start

_start:
    xor rax, rax               ; running sum
    mov rcx, 10                ; loop counter, also the current term
sum_loop:
    mov rbx, rcx
    imul rbx, rbx              ; rbx = rcx * rcx
    add rax, rbx
    loop sum_loop              ; dec rcx; jnz sum_loop

    ; rax = 385; exit status is taken mod 256 -> 129
    mov rdi, rax
    mov rax, 60
    syscall
