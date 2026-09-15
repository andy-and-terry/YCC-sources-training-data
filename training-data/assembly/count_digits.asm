; x86-64 NASM: count the number of decimal digits in a positive integer
section .text
    global _start

_start:
    mov rax, 4207          ; number
    xor rbx, rbx            ; digit count = 0

count_loop:
    inc rbx
    xor rdx, rdx
    mov rcx, 10
    div rcx                  ; rax = rax / 10, rdx = rax % 10
    cmp rax, 0
    jne count_loop

    ; rbx now holds the digit count (4207 has 4 digits); exit with it
    mov rdi, rbx
    mov rax, 60
    syscall
