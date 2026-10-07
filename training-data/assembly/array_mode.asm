; x86-64 NASM: find the most frequently occurring value in a small array
section .data
    array dq 4, 2, 4, 7, 4, 2, 9
    count equ 7

section .text
    global _start

_start:
    xor r8, r8              ; best value
    xor r9, r9              ; best count
    xor rcx, rcx
outer_loop:
    cmp rcx, count
    jge done
    mov rax, [array + rcx * 8]
    xor rdx, rdx             ; frequency of array[rcx]
    xor rbx, rbx
inner_loop:
    cmp rbx, count
    jge tally_done
    cmp rax, [array + rbx * 8]
    jne inner_next
    inc rdx
inner_next:
    inc rbx
    jmp inner_loop
tally_done:
    cmp rdx, r9
    jle outer_next
    mov r9, rdx
    mov r8, rax
outer_next:
    inc rcx
    jmp outer_loop
done:
    mov rdi, r8               ; mode = 4
    mov rax, 60
    syscall
