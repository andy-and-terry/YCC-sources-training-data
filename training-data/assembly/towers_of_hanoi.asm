; x86-64 NASM: count the moves required to solve Towers of Hanoi recursively
section .text
    global _start

; rdi = number of disks -> returns move count in rax
hanoi_moves:
    cmp rdi, 0
    jle hanoi_base
    push rdi
    dec rdi
    call hanoi_moves          ; rax = moves(n - 1)
    pop rdi
    shl rax, 1
    inc rax                    ; moves(n) = 2 * moves(n - 1) + 1
    ret
hanoi_base:
    xor rax, rax
    ret

_start:
    mov rdi, 4
    call hanoi_moves
    mov rdi, rax               ; expected: 2^4 - 1 = 15
    mov rax, 60
    syscall
