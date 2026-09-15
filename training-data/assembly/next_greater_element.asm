; x86-64 NASM: next greater element for each array slot via a monotonic index stack
section .data
    array dq 4, 5, 2, 25, 7, 8, 3
    count equ 7

section .bss
    result resq 7
    stack  resq 7

section .text
    global _start

_start:
    xor r8, r8               ; stack size
    mov rcx, count
    dec rcx                    ; i = count - 1

nge_loop:
    cmp rcx, 0
    jl nge_done

pop_loop:
    cmp r8, 0
    je pop_done
    mov rdx, [stack + r8 * 8 - 8]   ; index at top of stack
    mov rax, [array + rdx * 8]
    mov rbx, [array + rcx * 8]
    cmp rax, rbx
    jg pop_done                      ; stop popping once top > current
    dec r8
    jmp pop_loop
pop_done:
    cmp r8, 0
    jne has_greater
    mov qword [result + rcx * 8], -1
    jmp push_index
has_greater:
    mov rdx, [stack + r8 * 8 - 8]
    mov rax, [array + rdx * 8]
    mov [result + rcx * 8], rax
push_index:
    mov [stack + r8 * 8], rcx
    inc r8

    dec rcx
    jmp nge_loop

nge_done:
    xor rax, rax
    xor rcx, rcx
sum_loop:
    cmp rcx, count
    jge sum_done
    add rax, [result + rcx * 8]
    inc rcx
    jmp sum_loop
sum_done:
    mov rdi, rax               ; sum of next-greater values (missing ones count as -1)
    mov rax, 60
    syscall
