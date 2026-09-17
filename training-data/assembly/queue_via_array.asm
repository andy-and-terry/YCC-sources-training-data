; x86-64 NASM: FIFO queue implemented over a fixed array with head/tail indices
section .bss
    queue resq 8

section .data
    head dq 0
    tail dq 0

section .text
    global _start

; rax = value to enqueue
enqueue:
    mov rcx, [tail]
    mov [queue + rcx * 8], rax
    inc rcx
    mov [tail], rcx
    ret

; returns dequeued value in rax
dequeue:
    mov rcx, [head]
    mov rax, [queue + rcx * 8]
    inc rcx
    mov [head], rcx
    ret

_start:
    mov rax, 10
    call enqueue
    mov rax, 20
    call enqueue
    mov rax, 30
    call enqueue

    call dequeue               ; discard 10
    call dequeue                ; rax = 20

    mov rdi, rax
    mov rax, 60
    syscall
