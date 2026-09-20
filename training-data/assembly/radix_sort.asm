; x86-64 NASM: LSD radix sort (base 10) for two-digit non-negative integers
section .data
    array dq 29, 4, 71, 58, 15, 87, 33, 2
    len equ 8
    exps dq 1, 10           ; ones-digit pass, then tens-digit pass
    num_exps equ 2

section .bss
    counts resq 10
    output resq len

section .text
    global _start

_start:
    xor r12, r12               ; pass index
pass_loop:
    cmp r12, num_exps
    jge sort_done
    mov r13, [exps + r12 * 8]  ; current place value (exp)

    lea rdi, [counts]
    xor rcx, rcx
zero_counts:
    cmp rcx, 10
    jge zero_done
    mov qword [rdi + rcx * 8], 0
    inc rcx
    jmp zero_counts
zero_done:

    xor r8, r8                 ; i
count_digits_loop:
    cmp r8, len
    jge count_digits_done
    mov rax, [array + r8 * 8]
    xor rdx, rdx
    div r13                     ; rax = num / exp
    xor rdx, rdx
    mov rbx, 10
    div rbx                      ; rdx = (num / exp) mod 10 = digit
    inc qword [counts + rdx * 8]
    inc r8
    jmp count_digits_loop
count_digits_done:

    mov rcx, 1
cum_loop:
    cmp rcx, 10
    jge cum_done
    mov rax, [counts + rcx * 8 - 8]
    add [counts + rcx * 8], rax
    inc rcx
    jmp cum_loop
cum_done:

    mov r8, len
    dec r8                       ; i = len - 1, walk backwards for stability
build_loop:
    cmp r8, 0
    jl build_done
    mov rax, [array + r8 * 8]
    push rax
    xor rdx, rdx
    div r13
    xor rdx, rdx
    mov rbx, 10
    div rbx                       ; rdx = digit
    dec qword [counts + rdx * 8]
    mov rcx, [counts + rdx * 8]
    pop rax
    mov [output + rcx * 8], rax
    dec r8
    jmp build_loop
build_done:

    xor r8, r8
copy_loop:
    cmp r8, len
    jge copy_done
    mov rax, [output + r8 * 8]
    mov [array + r8 * 8], rax
    inc r8
    jmp copy_loop
copy_done:
    inc r12
    jmp pass_loop

sort_done:
    mov rax, [array]
    mov rdi, rax
    mov rax, 60
    syscall
