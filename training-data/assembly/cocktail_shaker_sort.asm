; x86-64 NASM: cocktail shaker sort (bidirectional bubble sort)
section .data
    array dq 5, 1, 4, 2, 8, 0, 7
    count equ 7

section .text
    global _start

_start:
    xor r8, r8                 ; start bound
    mov r9, count
    dec r9                       ; end bound
shaker_outer:
    cmp r8, r9
    jge shaker_done
    xor r10, r10                  ; swapped flag

    ; forward pass: bubble the largest remaining element to the end
    mov rcx, r8
forward_loop:
    cmp rcx, r9
    jge forward_done
    mov rax, [array + rcx * 8]
    mov rbx, [array + rcx * 8 + 8]
    cmp rax, rbx
    jle forward_next
    mov [array + rcx * 8], rbx
    mov [array + rcx * 8 + 8], rax
    mov r10, 1
forward_next:
    inc rcx
    jmp forward_loop
forward_done:
    dec r9

    ; backward pass: bubble the smallest remaining element to the start
    mov rcx, r9
backward_loop:
    cmp rcx, r8
    jle backward_done
    mov rax, [array + rcx * 8 - 8]
    mov rbx, [array + rcx * 8]
    cmp rax, rbx
    jle backward_next
    mov [array + rcx * 8 - 8], rbx
    mov [array + rcx * 8], rax
    mov r10, 1
backward_next:
    dec rcx
    jmp backward_loop
backward_done:
    inc r8

    test r10, r10
    jz shaker_done
    jmp shaker_outer
shaker_done:
    ; array is now sorted ascending; exit with the largest element (8)
    mov rax, [array + (count - 1) * 8]
    mov rdi, rax
    mov rax, 60
    syscall
