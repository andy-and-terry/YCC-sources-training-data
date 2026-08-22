; x86-64 NASM: clamp a value between a lower and upper bound
section .text
    global _start

_start:
    mov rax, 150         ; value
    mov rbx, 0            ; min
    mov rcx, 100          ; max
    cmp rax, rbx
    jge check_max
    mov rax, rbx
    jmp done
check_max:
    cmp rax, rcx
    jle done
    mov rax, rcx
done:
    mov rdi, rax
    mov rax, 60
    syscall
