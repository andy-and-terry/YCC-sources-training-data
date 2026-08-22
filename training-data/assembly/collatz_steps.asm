; x86-64 NASM: count the number of steps in the Collatz sequence
section .text
    global _start

_start:
    mov rax, 27          ; n
    xor rcx, rcx          ; steps
collatz_loop:
    cmp rax, 1
    je done
    test rax, 1
    jz even
    ; odd: n = 3n + 1
    lea rax, [rax * 3 + 1]
    jmp step_done
even:
    shr rax, 1
step_done:
    inc rcx
    jmp collatz_loop
done:
    mov rdi, rcx
    mov rax, 60
    syscall
