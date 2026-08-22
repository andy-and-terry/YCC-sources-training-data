; x86-64 NASM: find the second-largest element in an array
section .data
    array dq 5, 3, 8, 1, 9, 2
    count equ 6

section .text
    global _start

_start:
    mov rax, -1          ; largest
    mov rbx, -1           ; second largest
    xor rcx, rcx
scan_loop:
    cmp rcx, count
    jge done
    mov rdx, [array + rcx * 8]
    cmp rdx, rax
    jle check_second
    mov rbx, rax
    mov rax, rdx
    jmp next
check_second:
    cmp rdx, rax
    je next
    cmp rdx, rbx
    jle next
    mov rbx, rdx
next:
    inc rcx
    jmp scan_loop
done:
    mov rdi, rbx
    mov rax, 60
    syscall
