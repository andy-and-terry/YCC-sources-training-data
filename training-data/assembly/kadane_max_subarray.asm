; x86-64 NASM: maximum subarray sum via Kadane's algorithm
section .data
    array dq -2, 1, -3, 4, -1, 2, 1, -5, 4
    count equ 9

section .text
    global _start

_start:
    mov rax, [array]         ; max_so_far = array[0]
    mov rbx, [array]         ; max_ending_here = array[0]
    mov rcx, 1
kadane_loop:
    cmp rcx, count
    jge kadane_done
    mov rdx, [array + rcx * 8]

    mov rsi, rbx
    add rsi, rdx               ; rsi = max_ending_here + array[i]
    cmp rdx, rsi
    jge use_element
    mov rbx, rsi
    jmp update_best
use_element:
    mov rbx, rdx                ; start a new subarray at array[i]
update_best:
    cmp rbx, rax
    jle kadane_next
    mov rax, rbx
kadane_next:
    inc rcx
    jmp kadane_loop
kadane_done:
    ; rax now holds the best subarray sum (4,-1,2,1 => 6)
    mov rdi, rax
    mov rax, 60
    syscall
