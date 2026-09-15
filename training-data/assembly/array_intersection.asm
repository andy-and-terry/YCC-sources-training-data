; x86-64 NASM: count the number of values shared between two arrays
section .data
    array1 dq 4, 9, 5, 1
    count1 equ 4
    array2 dq 9, 4, 9, 8, 4
    count2 equ 5

section .text
    global _start

_start:
    xor rax, rax               ; running count of matches
    xor r8, r8                  ; i over array1
outer_loop:
    cmp r8, count1
    jge done
    mov r10, [array1 + r8 * 8]
    xor r9, r9                   ; j over array2
inner_loop:
    cmp r9, count2
    jge next_i
    mov r11, [array2 + r9 * 8]
    cmp r10, r11
    jne inner_next
    inc rax
    jmp next_i                    ; count array1[i] once, then move on
inner_next:
    inc r9
    jmp inner_loop
next_i:
    inc r8
    jmp outer_loop
done:
    mov rdi, rax
    mov rax, 60
    syscall
