; x86-64 NASM: |A & B| and |A | B| for bitmask sets, A={1,2,3,4}, B={3,4,5}
; exit status: inter*10 + union = 2*10 + 5 = 25
section .text
    global _start

_start:
    mov rax, 0b011110   ; {1,2,3,4}
    mov rbx, 0b111000   ; {3,4,5}
    mov rcx, rax
    and rcx, rbx
    popcnt rcx, rcx
    or rax, rbx
    popcnt rax, rax
    imul rcx, rcx, 10
    add rcx, rax
    mov rdi, rcx
    mov rax, 60
    syscall
