; x86-64 NASM: move all zeroes in an array to the end, preserving the
; relative order of the non-zero elements (in place, two-pointer)
section .data
    array dq 0, 1, 0, 3, 12, 0, 7
    count equ 7

section .text
    global _start

_start:
    xor r8, r8               ; j = write index for next non-zero
    xor r9, r9               ; i = scan index
move_loop:
    cmp r9, count
    jge move_done
    mov rax, [array + r9 * 8]
    test rax, rax
    jz move_next
    mov rbx, [array + r8 * 8]
    mov [array + r8 * 8], rax
    mov [array + r9 * 8], rbx
    inc r8
move_next:
    inc r9
    jmp move_loop
move_done:
    ; array is now 1, 3, 12, 7, 0, 0, 0; exit with the first element
    mov rax, [array]
    mov rdi, rax
    mov rax, 60
    syscall
