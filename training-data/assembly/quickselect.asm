; x86-64 NASM: quickselect to find the k-th smallest element (0-indexed)
; using a Lomuto partition, iterating instead of recursing
section .data
    array dq 7, 2, 9, 4, 1, 8, 3
    count equ 7
    k equ 2                  ; find the 3rd smallest (expect 3)

section .text
    global _start

_start:
    xor r8, r8               ; lo
    mov r9, count
    dec r9                    ; hi

select_loop:
    cmp r8, r9
    jge finished
    mov rdi, r8
    mov rsi, r9
    call partition             ; rax = pivot index
    cmp rax, k
    je finished
    jg select_right
    mov r8, rax
    inc r8
    jmp select_loop
select_right:
    mov r9, rax
    dec r9
    jmp select_loop
finished:
    mov rax, [array + k * 8]
    mov rdi, rax
    mov rax, 60
    syscall

; Lomuto partition of array[rdi..rsi], pivot = array[rsi]; returns index in rax
partition:
    mov rcx, [array + rsi * 8]  ; pivot value
    mov r10, rdi                 ; store index
    mov r11, rdi                 ; scan index
part_loop:
    cmp r11, rsi
    jge part_place_pivot
    mov rax, [array + r11 * 8]
    cmp rax, rcx
    jg part_next
    ; swap array[r10], array[r11]
    mov rbx, [array + r10 * 8]
    mov [array + r10 * 8], rax
    mov [array + r11 * 8], rbx
    inc r10
part_next:
    inc r11
    jmp part_loop
part_place_pivot:
    mov rax, [array + r10 * 8]
    mov rbx, [array + rsi * 8]
    mov [array + r10 * 8], rbx
    mov [array + rsi * 8], rax
    mov rax, r10
    ret
