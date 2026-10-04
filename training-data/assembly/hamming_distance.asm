; x86-64 NASM: Hamming distance between two integers (exit code = result)
section .text
    global _start

_start:
    mov rax, 0b101101    ; a
    mov rbx, 0b100011    ; b
    xor rax, rbx         ; differing bits
    xor rdi, rdi         ; counter
.loop:
    test rax, rax
    jz .done
    mov rcx, rax
    dec rcx
    and rax, rcx         ; clear lowest set bit
    inc rdi
    jmp .loop
.done:
    mov rax, 60          ; exit(3)
    syscall
