; x86-64 NASM: Kadane's algorithm for maximum subarray sum
section .data
    array dq -2, 1, -3, 4, -1, 2, 1, -5, 4
    count equ 9

section .text
    global _start

_start:
    mov rax, [array]           ; max_ending_here
    mov rbx, rax                ; max_so_far
    mov rcx, 1
loop_start:
    cmp rcx, count
    jge loop_done
    mov rdx, [array + rcx * 8] ; current element
    mov rsi, rax
    add rsi, rdx                ; candidate = max_ending_here + current
    cmp rdx, rsi
    jge use_current
    mov rax, rsi                 ; max_ending_here = candidate
    jmp me_updated
use_current:
    mov rax, rdx                 ; max_ending_here = current
me_updated:
    cmp rax, rbx
    jle skip_update
    mov rbx, rax                 ; max_so_far = max_ending_here
skip_update:
    inc rcx
    jmp loop_start
loop_done:
    mov rdi, rbx
    mov rax, 60
    syscall
