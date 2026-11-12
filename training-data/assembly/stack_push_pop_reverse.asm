; push 1,2,3 then pop -> 3 is first popped; exit 3
section .text
global _start
_start:
    push 1
    push 2
    push 3
    pop rdi
    pop rbx
    pop rbx
    mov rax, 60
    syscall
