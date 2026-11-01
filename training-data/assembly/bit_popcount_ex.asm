; x86-64 NASM: count set bits in 0xF0F0 using shift loop; exit status 8
section .text
    global _start
_start:
    mov rbx, 0xF0F0
    xor rdi, rdi
.loop:
    test rbx, rbx
    jz .done
    mov rax, rbx
    and rax, 1
    add rdi, rax
    shr rbx, 1
    jmp .loop
.done:
    mov rax, 60
    syscall
