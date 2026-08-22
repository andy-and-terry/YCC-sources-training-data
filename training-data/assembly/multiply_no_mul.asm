; x86-64 NASM: multiply two numbers using repeated addition
section .text
    global _start

_start:
    mov rax, 7           ; a
    mov rbx, 6            ; b
    xor rcx, rcx          ; result
    xor rdx, rdx          ; counter
mul_loop:
    cmp rdx, rbx
    jge done
    add rcx, rax
    inc rdx
    jmp mul_loop
done:
    mov rdi, rcx
    mov rax, 60
    syscall
