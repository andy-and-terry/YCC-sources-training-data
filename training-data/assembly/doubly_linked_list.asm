; x86-64 NASM: build a doubly linked list and traverse it backward, summing values
; each node is 24 bytes: [value, next, prev]
section .data
    node1 dq 10, node2, 0
    node2 dq 20, node3, node1
    node3 dq 30, 0, node2

section .text
    global _start

_start:
    lea rbx, [node3]         ; start at the tail
    xor rax, rax              ; running sum
backward_loop:
    test rbx, rbx
    jz backward_done
    add rax, [rbx]              ; value field
    mov rbx, [rbx + 16]           ; prev pointer
    jmp backward_loop
backward_done:
    mov rdi, rax
    mov rax, 60
    syscall
