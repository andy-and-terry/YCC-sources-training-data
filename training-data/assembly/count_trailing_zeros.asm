; x86-64 NASM: count trailing zero bits using the BSF instruction
section .text
    global _start

_start:
    mov rax, 48          ; 0b110000 -> 4 trailing zeros
    bsf rbx, rax         ; rbx = index of lowest set bit
    mov rdi, rbx
    mov rax, 60
    syscall
