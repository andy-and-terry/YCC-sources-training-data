; x86-64 NASM: recursive top-down merge sort
section .data
    array dq 5, 2, 9, 1, 5, 6, 3
    count equ 7

section .bss
    scratch resq 7

section .text
    global _start

; rdi = array pointer, rsi = low, rdx = high (inclusive indices)
merge_sort:
    cmp rsi, rdx
    jge ms_done
    mov rax, rsi
    add rax, rdx
    shr rax, 1               ; rax = mid = (low + high) / 2
    push rdi
    push rsi
    push rdx
    push rax
    mov rdx, rax              ; high = mid for the left half
    call merge_sort            ; sort [low, mid]
    pop rax
    pop rdx
    pop rsi
    pop rdi
    push rdi
    push rsi
    push rdx
    push rax
    mov rsi, rax
    inc rsi                     ; low = mid + 1 for the right half
    call merge_sort              ; sort [mid + 1, high]
    pop rax
    pop rdx
    pop rsi
    pop rdi
    push rdi
    push rsi
    push rdx
    mov r10, rax                  ; r10 = mid, passed to do_merge
    call do_merge
    pop rdx
    pop rsi
    pop rdi
ms_done:
    ret

; do_merge: rdi = array pointer, rsi = low, rdx = high, r10 = mid
do_merge:
    mov r8, rsi                ; i = low (left cursor)
    mov r9, r10
    inc r9                       ; j = mid + 1 (right cursor)
    mov r11, rsi                  ; k = low (scratch write cursor)
merge_loop:
    cmp r8, r10
    jg right_remainder
    cmp r9, rdx
    jg left_remainder
    mov rax, [rdi + r8 * 8]
    mov rbx, [rdi + r9 * 8]
    cmp rax, rbx
    jg take_right
take_left:
    mov [scratch + r11 * 8], rax
    inc r8
    jmp advance
take_right:
    mov [scratch + r11 * 8], rbx
    inc r9
advance:
    inc r11
    jmp merge_loop
left_remainder:
    cmp r8, r10
    jg copy_back
    mov rax, [rdi + r8 * 8]
    mov [scratch + r11 * 8], rax
    inc r8
    inc r11
    jmp left_remainder
right_remainder:
    cmp r9, rdx
    jg copy_back
    mov rax, [rdi + r9 * 8]
    mov [scratch + r11 * 8], rax
    inc r9
    inc r11
    jmp right_remainder
copy_back:
    mov rcx, rsi
copy_loop:
    cmp rcx, rdx
    jg do_merge_ret
    mov rax, [scratch + rcx * 8]
    mov [rdi + rcx * 8], rax
    inc rcx
    jmp copy_loop
do_merge_ret:
    ret

_start:
    lea rdi, [array]
    xor rsi, rsi
    mov rdx, count - 1
    call merge_sort
    mov rax, [array]
    mov rdi, rax
    mov rax, 60
    syscall
