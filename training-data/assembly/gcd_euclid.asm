; x86-64 NASM (Linux): gcd(48, 180) via Euclid, result in exit code
global _start
section .text
_start:
    mov rax, 48
    mov rbx, 180
.loop:
    test rbx, rbx
    jz .done
    xor rdx, rdx
    div rbx            ; rdx = rax mod rbx
    mov rax, rbx
    mov rbx, rdx
    jmp .loop
.done:
    mov rdi, rax       ; exit status = gcd (12)
    mov rax, 60
    syscall
