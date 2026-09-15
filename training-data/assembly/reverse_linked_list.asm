; x86-64 NASM: reverse a singly linked list in place, then sum it to confirm it's intact
section .data
    node1 dq 10, node2
    node2 dq 20, node3
    node3 dq 30, 0

section .text
    global _start

_start:
    lea rax, [node1]        ; cur = head
    xor rbx, rbx              ; prev = null

reverse_loop:
    test rax, rax
    jz reverse_done
    mov rcx, [rax + 8]          ; next = cur->next
    mov [rax + 8], rbx            ; cur->next = prev
    mov rbx, rax                    ; prev = cur
    mov rax, rcx                      ; cur = next
    jmp reverse_loop

reverse_done:
    ; rbx now holds the new head (originally the last node)
    xor rax, rax               ; sum
    mov rcx, rbx
sum_loop:
    test rcx, rcx
    jz sum_done
    add rax, [rcx]
    mov rcx, [rcx + 8]
    jmp sum_loop
sum_done:
    mov rdi, rax
    mov rax, 60
    syscall
