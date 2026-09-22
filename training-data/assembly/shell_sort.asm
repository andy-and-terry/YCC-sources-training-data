; x86-64 NASM: shell sort an array in place using a halving gap sequence
section .data
    array dq 5, 2, 9, 1, 5, 6, 3, 8
    count equ 8

section .text
    global _start

_start:
    mov r8, count
    shr r8, 1                 ; gap = count / 2
gap_loop:
    cmp r8, 0
    je sort_done
    mov r9, r8                 ; i = gap
i_loop:
    cmp r9, count
    jge next_gap
    mov r10, [array + r9 * 8]   ; temp = array[i]
    mov r11, r9                  ; j = i
j_loop:
    cmp r11, r8
    jl insert_temp                ; j < gap: stop shifting
    mov rax, r11
    sub rax, r8                    ; rax = j - gap
    mov rbx, [array + rax * 8]
    cmp rbx, r10
    jle insert_temp
    mov [array + r11 * 8], rbx       ; array[j] = array[j - gap]
    mov r11, rax                      ; j -= gap
    jmp j_loop
insert_temp:
    mov [array + r11 * 8], r10
    inc r9
    jmp i_loop
next_gap:
    shr r8, 1
    jmp gap_loop
sort_done:
    mov rax, [array]
    mov rdi, rax
    mov rax, 60
    syscall
