; x86-64 NASM: Collatz steps for 6 (6->3->10->5->16->8->4->2->1)
; exit status: 8
section .text
    global _start

_start:
    mov rax, 6
    xor rdi, rdi
collatz:
    cmp rax, 1
    je done
    test al, 1
    jnz odd
    shr rax, 1
    jmp next
odd:
    lea rax, [rax + rax*2 + 1]
next:
    inc rdi
    jmp collatz
done:
    mov rax, 60
    syscall
