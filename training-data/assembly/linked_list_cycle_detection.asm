; x86-64 NASM: detect a cycle in a singly linked list with Floyd's
; tortoise-and-hare algorithm
section .data
    node1 dq 10, node2
    node2 dq 20, node3
    node3 dq 30, node2      ; node3 points back to node2, forming a cycle

section .text
    global _start

_start:
    lea rax, [node1]         ; slow pointer
    lea rbx, [node1]         ; fast pointer

detect_loop:
    mov rbx, [rbx + 8]
    test rbx, rbx
    jz no_cycle
    mov rbx, [rbx + 8]
    test rbx, rbx
    jz no_cycle
    mov rax, [rax + 8]
    cmp rax, rbx
    je cycle_found
    jmp detect_loop

no_cycle:
    mov rdi, 0
    jmp finish
cycle_found:
    mov rdi, 1               ; expected: 1 (a cycle exists)
finish:
    mov rax, 60
    syscall
