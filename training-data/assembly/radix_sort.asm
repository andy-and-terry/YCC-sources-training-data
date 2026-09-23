; x86-64 NASM: LSD radix sort (base 10) on an array of non-negative integers
section .data
    array dq 170, 45, 75, 90, 802, 24, 2, 66
    len equ 8
    max_val equ 802

section .bss
    output resq len
    digit_count resq 10

section .text
    global _start

_start:
    mov r12, 1                   ; place value: 1, 10, 100, ...

radix_pass:
    ; zero the digit counts
    xor rcx, rcx
zero_loop:
    cmp rcx, 10
    jge zero_done
    mov qword [digit_count + rcx * 8], 0
    inc rcx
    jmp zero_loop
zero_done:

    ; count occurrences of each digit at the current place value
    xor r8, r8
count_loop:
    cmp r8, len
    jge count_done
    mov rax, [array + r8 * 8]
    xor rdx, rdx
    div r12
    xor rdx, rdx
    mov rbx, 10
    div rbx                      ; rdx = digit at this place
    inc qword [digit_count + rdx * 8]
    inc r8
    jmp count_loop
count_done:

    ; turn counts into prefix sums (positions)
    mov rcx, 1
prefix_loop:
    cmp rcx, 10
    jge prefix_done
    mov rax, [digit_count + rcx * 8 - 8]
    add [digit_count + rcx * 8], rax
    inc rcx
    jmp prefix_loop
prefix_done:

    ; place elements into output, stably, scanning from the end
    mov r9, len
build_loop:
    cmp r9, 0
    je build_done
    dec r9
    mov rax, [array + r9 * 8]
    xor rdx, rdx
    div r12
    xor rdx, rdx
    mov rbx, 10
    div rbx                       ; rdx = digit
    dec qword [digit_count + rdx * 8]
    mov rcx, [digit_count + rdx * 8]
    mov rax, [array + r9 * 8]
    mov [output + rcx * 8], rax
    jmp build_loop
build_done:

    ; copy output back into array for the next pass
    xor r8, r8
copy_loop:
    cmp r8, len
    jge copy_done
    mov rax, [output + r8 * 8]
    mov [array + r8 * 8], rax
    inc r8
    jmp copy_loop
copy_done:

    imul r12, 10
    cmp r12, max_val
    jle radix_pass

    ; array is now fully sorted; exit with the smallest element (2)
    mov rax, [array]
    mov rdi, rax
    mov rax, 60
    syscall
