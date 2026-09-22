; x86-64 NASM: insert values into a binary search tree (preallocated node pool),
; then sum all values via a recursive inorder traversal
section .bss
    pool resq 30
    next_free resq 1

section .data
    root dq 0

section .text
    global _start

; rdi = value; allocates a node from the pool and returns its address in rax
new_node:
    mov rax, [next_free]
    mov [rax], rdi                 ; value
    mov qword [rax + 8], 0           ; left
    mov qword [rax + 16], 0           ; right
    lea r9, [rax + 24]
    mov [next_free], r9
    ret

; rdi = node pointer (0 = empty subtree), rsi = value to insert
; returns the (possibly new) subtree root in rax
insert:
    test rdi, rdi
    jnz has_node
    push rsi
    mov rdi, rsi
    call new_node
    pop rsi
    ret
has_node:
    mov rax, [rdi]
    cmp rsi, rax
    je insert_ret_self
    jg insert_right
insert_left:
    push rdi
    push rsi
    mov rdi, [rdi + 8]
    call insert
    pop rsi
    pop rdi
    mov [rdi + 8], rax
    mov rax, rdi
    ret
insert_right:
    push rdi
    push rsi
    mov rdi, [rdi + 16]
    call insert
    pop rsi
    pop rdi
    mov [rdi + 16], rax
    mov rax, rdi
    ret
insert_ret_self:
    mov rax, rdi
    ret

; rdi = node pointer; returns the sum of the subtree's values in rax
inorder_sum:
    test rdi, rdi
    jnz sum_has_node
    xor rax, rax
    ret
sum_has_node:
    push rdi
    mov rdi, [rdi + 8]
    call inorder_sum
    pop rdi
    push rax
    push rdi
    mov rdi, [rdi + 16]
    call inorder_sum
    pop rdi
    pop r8
    add rax, r8
    add rax, [rdi]
    ret

_start:
    lea rax, [pool]
    mov [next_free], rax

    mov rdi, [root]
    mov rsi, 50
    call insert
    mov [root], rax

    mov rdi, [root]
    mov rsi, 30
    call insert
    mov [root], rax

    mov rdi, [root]
    mov rsi, 70
    call insert
    mov [root], rax

    mov rdi, [root]
    mov rsi, 20
    call insert
    mov [root], rax

    mov rdi, [root]
    mov rsi, 40
    call insert
    mov [root], rax

    mov rdi, [root]
    call inorder_sum
    mov rdi, rax
    mov rax, 60
    syscall
