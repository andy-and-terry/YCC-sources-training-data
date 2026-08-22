; x86-64 NASM: sum values in a conceptual 3x3 grid using nested loops
section .text
    global _start

_start:
    xor rax, rax          ; total
    xor rcx, rcx          ; row
row_loop:
    cmp rcx, 3
    jge done
    xor rdx, rdx          ; col
col_loop:
    cmp rdx, 3
    jge next_row
    mov rbx, rcx
    imul rbx, 3
    add rbx, rdx
    add rax, rbx
    inc rdx
    jmp col_loop
next_row:
    inc rcx
    jmp row_loop
done:
    mov rdi, rax
    mov rax, 60
    syscall
