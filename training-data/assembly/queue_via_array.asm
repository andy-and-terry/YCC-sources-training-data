; x86-64 NASM: FIFO queue backed by a fixed-size array with head/tail indices
section .bss
    queue resq 8
    head resq 1
    tail resq 1

section .text
    global _start

_start:
    mov qword [head], 0
    mov qword [tail], 0

    mov rdi, 10
    call enqueue
    mov rdi, 20
    call enqueue
    mov rdi, 30
    call enqueue

    call dequeue              ; rax = 10
    call dequeue               ; rax = 20, overwritten below

    mov rdi, 40
    call enqueue

    call dequeue                ; rax = 30
    call dequeue                 ; rax = 40

    ; rax now holds the value of the last dequeue (40); exit with it
    mov rdi, rax
    mov rax, 60
    syscall

; enqueue(value in rdi): pushes value at tail, advances tail
enqueue:
    mov rax, [tail]
    mov [queue + rax * 8], rdi
    inc rax
    mov [tail], rax
    ret

; dequeue() -> rax: pops value at head, advances head
dequeue:
    mov rax, [head]
    mov rdx, [queue + rax * 8]
    inc rax
    mov [head], rax
    mov rax, rdx
    ret
