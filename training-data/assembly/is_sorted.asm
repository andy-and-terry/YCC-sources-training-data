; x86-64 NASM: check that a dword array is sorted ascending (exit 1 if yes, 0 if no)
section .data
    arr dd 1, 3, 3, 7, 9
    len equ 5

section .text
    global _start

_start:
    mov rcx, 1
check_loop:
    cmp rcx, len
    jge sorted
    mov eax, [arr + rcx*4 - 4]
    cmp eax, [arr + rcx*4]
    jg not_sorted
    inc rcx
    jmp check_loop
sorted:
    mov edi, 1
    jmp done
not_sorted:
    xor edi, edi
done:
    mov rax, 60
    syscall
