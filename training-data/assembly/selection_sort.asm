; x86-64 NASM: selection sort over a fixed array
section .data
    array dq 29, 10, 14, 37, 13, 4, 25
    count equ 7

section .text
    global _start

_start:
    xor r8, r8              ; i = 0

outer_loop:
    cmp r8, count - 1
    jge sort_done

    mov r9, r8               ; min_idx = i
    mov r10, r8
    inc r10                   ; j = i + 1

inner_loop:
    cmp r10, count
    jge do_swap
    mov rax, [array + r9 * 8]
    mov rbx, [array + r10 * 8]
    cmp rbx, rax
    jge skip_update
    mov r9, r10               ; min_idx = j

skip_update:
    inc r10
    jmp inner_loop

do_swap:
    mov rax, [array + r8 * 8]
    mov rbx, [array + r9 * 8]
    mov [array + r8 * 8], rbx
    mov [array + r9 * 8], rax

    inc r8
    jmp outer_loop

sort_done:
    ; array is now sorted ascending; exit with the smallest element
    mov rdi, [array]
    mov rax, 60
    syscall
