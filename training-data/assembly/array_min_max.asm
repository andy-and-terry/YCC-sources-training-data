; x86-64 NASM: find both the minimum and maximum of an array in one pass
section .data
    array dq 7, 2, 9, 4, 1, 8, 3
    count equ 7

section .text
    global _start

_start:
    mov rax, [array]      ; min = array[0]
    mov rbx, [array]      ; max = array[0]
    mov rcx, 1
scan_loop:
    cmp rcx, count
    jge scan_done
    mov rdx, [array + rcx * 8]
    cmp rdx, rax
    jge check_max
    mov rax, rdx
check_max:
    cmp rdx, rbx
    jle scan_next
    mov rbx, rdx
scan_next:
    inc rcx
    jmp scan_loop
scan_done:
    ; rax = min (1), rbx = max (9); exit with their difference (max - min)
    sub rbx, rax
    mov rdi, rbx
    mov rax, 60
    syscall
