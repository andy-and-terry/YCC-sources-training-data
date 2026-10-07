; x86-64 NASM: heap sort using iterative sift-down on a max-heap
section .data
    array dq 5, 2, 9, 1, 5, 6, 3
    count equ 7

section .text
    global _start

; rdi = pointer, rsi = heap size, rdx = index to sift down from
sift_down:
    push rbx
    push r8
    push r9
    push r10
sift_loop:
    mov r8, rdx
    add r8, rdx
    inc r8                   ; left = 2*i + 1
    mov r9, r8
    inc r9                   ; right = 2*i + 2
    mov r10, rdx              ; largest = i

    cmp r8, rsi
    jge check_right
    mov rax, [rdi + r8 * 8]
    mov rbx, [rdi + r10 * 8]
    cmp rax, rbx
    jle check_right
    mov r10, r8
check_right:
    cmp r9, rsi
    jge do_swap
    mov rax, [rdi + r9 * 8]
    mov rbx, [rdi + r10 * 8]
    cmp rax, rbx
    jle do_swap
    mov r10, r9
do_swap:
    cmp r10, rdx
    je sift_done
    mov rax, [rdi + rdx * 8]
    mov rbx, [rdi + r10 * 8]
    mov [rdi + rdx * 8], rbx
    mov [rdi + r10 * 8], rax
    mov rdx, r10
    jmp sift_loop
sift_done:
    pop r10
    pop r9
    pop r8
    pop rbx
    ret

_start:
    lea rdi, [array]
    mov rsi, count
    mov rdx, count
    shr rdx, 1
    dec rdx                   ; start = count/2 - 1
build_heap_loop:
    cmp rdx, 0
    jl build_done
    push rdx
    call sift_down
    pop rdx
    dec rdx
    jmp build_heap_loop
build_done:
    mov r15, count
    dec r15                   ; end index of the unsorted heap
sort_loop:
    cmp r15, 0
    jle sort_done
    mov rax, [rdi]
    mov rbx, [rdi + r15 * 8]
    mov [rdi], rbx
    mov [rdi + r15 * 8], rax
    mov rsi, r15               ; shrink heap size
    xor rdx, rdx
    push r15
    call sift_down
    pop r15
    dec r15
    jmp sort_loop
sort_done:
    mov rax, [array]
    mov rdi, rax
    mov rax, 60
    syscall
