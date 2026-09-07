; x86-64 NASM: build and traverse a singly linked list, summing its values
section .data
    node1 dq 10, node2
    node2 dq 20, node3
    node3 dq 30, 0

section .text
    global _start

_start:
    lea rbx, [node1]
    xor rax, rax             ; sum
traverse_loop:
    test rbx, rbx
    jz traverse_done
    add rax, [rbx]            ; value field
    mov rbx, [rbx + 8]         ; next pointer
    jmp traverse_loop
traverse_done:
    mov rdi, rax
    mov rax, 60
    syscall
