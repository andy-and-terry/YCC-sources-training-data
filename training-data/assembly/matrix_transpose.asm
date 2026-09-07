; x86-64 NASM: transpose a 3x3 matrix in place
section .data
    matrix dq 1, 2, 3, 4, 5, 6, 7, 8, 9

section .text
    global _start

_start:
    lea rbx, [matrix]
    xor r8, r8                ; row
row_loop:
    cmp r8, 3
    jge done
    mov r9, r8                ; col starts at row + 1
    inc r9
col_loop:
    cmp r9, 3
    jge next_row
    mov rax, r8
    imul rax, 3
    add rax, r9                ; index (row, col)
    mov rcx, r9
    imul rcx, 3
    add rcx, r8                ; index (col, row)
    mov rdx, [rbx + rax * 8]
    mov rsi, [rbx + rcx * 8]
    mov [rbx + rax * 8], rsi
    mov [rbx + rcx * 8], rdx
    inc r9
    jmp col_loop
next_row:
    inc r8
    jmp row_loop
done:
    mov rax, [matrix + 8]      ; matrix[0][1], now equals original matrix[1][0]
    mov rdi, rax
    mov rax, 60
    syscall
