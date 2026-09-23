; x86-64 NASM: merge two already-sorted arrays into one sorted buffer
section .data
    a dq 1, 3, 5, 7, 9
    len_a equ 5
    b dq 2, 4, 6, 8, 10
    len_b equ 5

section .bss
    merged resq (len_a + len_b)

section .text
    global _start

_start:
    xor r8, r8               ; i (index into a)
    xor r9, r9               ; j (index into b)
    xor r10, r10             ; k (index into merged)

merge_loop:
    cmp r8, len_a
    jge merge_loop_done
    cmp r9, len_b
    jge merge_loop_done
    mov rax, [a + r8 * 8]
    mov rbx, [b + r9 * 8]
    cmp rax, rbx
    jg take_b
    mov [merged + r10 * 8], rax
    inc r8
    inc r10
    jmp merge_loop
take_b:
    mov [merged + r10 * 8], rbx
    inc r9
    inc r10
    jmp merge_loop
merge_loop_done:

copy_a_loop:
    cmp r8, len_a
    jge copy_a_done
    mov rax, [a + r8 * 8]
    mov [merged + r10 * 8], rax
    inc r8
    inc r10
    jmp copy_a_loop
copy_a_done:

copy_b_loop:
    cmp r9, len_b
    jge copy_b_done
    mov rax, [b + r9 * 8]
    mov [merged + r10 * 8], rax
    inc r9
    inc r10
    jmp copy_b_loop
copy_b_done:

    ; sum the merged array as a checksum (1+2+...+10 = 55)
    xor rax, rax
    xor rcx, rcx
sum_loop:
    cmp rcx, len_a + len_b
    jge sum_done
    add rax, [merged + rcx * 8]
    inc rcx
    jmp sum_loop
sum_done:
    mov rdi, rax
    mov rax, 60
    syscall
