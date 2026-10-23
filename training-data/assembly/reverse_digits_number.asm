; x86-64 NASM: reverse the decimal digits of a number (12345 -> 54321)
section .text
    global _start

_start:
    mov rax, 12345
    xor rbx, rbx         ; reversed = 0
    mov rcx, 10
rev_loop:
    test rax, rax
    jz done
    xor rdx, rdx
    div rcx              ; rax = quotient, rdx = digit
    imul rbx, rbx, 10
    add rbx, rdx
    jmp rev_loop
done:
    mov rdi, rbx         ; 54321 & 0xFF used as exit code
    mov rax, 60
    syscall
