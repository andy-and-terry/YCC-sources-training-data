; x86-64 NASM: breadth-first search over a 6-node graph given as an adjacency matrix
section .data
    ; row-major 6x6 adjacency matrix; edges: 0-1, 0-2, 1-3, 2-3, 3-4 (node 5 is isolated)
    adj dq 0,1,1,0,0,0, 1,0,0,1,0,0, 1,0,0,1,0,0, 0,1,1,0,1,0, 0,0,0,1,0,0, 0,0,0,0,0,0
    n equ 6

section .bss
    visited resq 6
    queue resq 6

section .text
    global _start

_start:
    xor rcx, rcx
zero_loop:
    cmp rcx, n
    jge zero_done
    mov qword [visited + rcx * 8], 0
    inc rcx
    jmp zero_loop
zero_done:

    xor r8, r8                  ; head
    xor r9, r9                   ; tail
    mov qword [visited], 1
    mov qword [queue], 0
    mov r9, 1                     ; tail = 1

    xor r15, r15                   ; visited_count
bfs_loop:
    cmp r8, r9
    jge bfs_done
    mov r10, [queue + r8 * 8]        ; current node
    inc r8
    inc r15

    xor r11, r11                       ; neighbor index
neighbor_loop:
    cmp r11, n
    jge neighbor_done
    mov rax, r10
    imul rax, n
    add rax, r11
    mov rbx, [adj + rax * 8]
    cmp rbx, 0
    je skip_neighbor
    cmp qword [visited + r11 * 8], 0
    jne skip_neighbor
    mov qword [visited + r11 * 8], 1
    mov [queue + r9 * 8], r11
    inc r9
skip_neighbor:
    inc r11
    jmp neighbor_loop
neighbor_done:
    jmp bfs_loop
bfs_done:
    mov rdi, r15
    mov rax, 60
    syscall
