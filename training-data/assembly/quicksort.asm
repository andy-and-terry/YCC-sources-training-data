; x86-64 NASM: recursive quicksort using Lomuto partition
section .data
    array dq 5, 2, 9, 1, 5, 6, 3
    count equ 7

section .text
    global _start

; rdi = pointer, rsi = low, rdx = high
partition:
    push r12
    push r13
    push r14
    mov r12, rdx            ; high
    mov r13, [rdi + r12 * 8] ; pivot = array[high]
    mov r14, rsi             ; i = low - 1 tracked as rsi - 1
    dec r14
    mov rcx, rsi             ; j = low
part_loop:
    cmp rcx, r12
    jge part_done
    mov rax, [rdi + rcx * 8]
    cmp rax, r13
    jg part_next
    inc r14
    mov rax, [rdi + r14 * 8]
    mov rbx, [rdi + rcx * 8]
    mov [rdi + rcx * 8], rax
    mov [rdi + r14 * 8], rbx
part_next:
    inc rcx
    jmp part_loop
part_done:
    inc r14
    mov rax, [rdi + r14 * 8]
    mov rbx, [rdi + r12 * 8]
    mov [rdi + r14 * 8], rbx
    mov [rdi + r12 * 8], rax
    mov rax, r14
    pop r14
    pop r13
    pop r12
    ret

; rdi = pointer, rsi = low, rdx = high
quicksort:
    cmp rsi, rdx
    jge qs_ret
    push rdi
    push rsi
    push rdx
    call partition            ; rax = pivot index
    mov r15, rax
    pop rdx
    pop rsi
    pop rdi
    push rdi
    push rsi
    push rdx
    push r15
    mov rdx, r15
    dec rdx
    call quicksort             ; sort left half
    pop r15
    pop rdx
    pop rsi
    pop rdi
    push rdi
    push rdx
    mov rsi, r15
    inc rsi
    call quicksort              ; sort right half
    pop rdx
    pop rdi
qs_ret:
    ret

_start:
    lea rdi, [array]
    xor rsi, rsi
    mov rdx, count
    dec rdx
    call quicksort
    mov rax, [array]
    mov rdi, rax
    mov rax, 60
    syscall
