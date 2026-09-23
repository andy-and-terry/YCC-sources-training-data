; x86-64 NASM: remove duplicates in place from a sorted array, returning
; the number of unique elements (two-pointer compaction)
section .data
    array dq 1, 1, 2, 2, 3, 4, 4, 5, 5, 5
    count equ 10

section .text
    global _start

_start:
    xor r8, r8                ; j = index of last unique element
    mov r9, 1                  ; i = scan index
dedup_loop:
    cmp r9, count
    jge dedup_done
    mov rax, [array + r8 * 8]
    mov rbx, [array + r9 * 8]
    cmp rax, rbx
    je dedup_next
    inc r8
    mov [array + r8 * 8], rbx
dedup_next:
    inc r9
    jmp dedup_loop
dedup_done:
    inc r8                     ; new length = j + 1 (expected: 5)
    mov rdi, r8
    mov rax, 60
    syscall
